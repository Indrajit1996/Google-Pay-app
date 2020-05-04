class ScratchCardService
	def initialize(options)
		@user1 = options[:sender_id]
		@user2 = options[:receiver_id]
		@amount = options[:amount]
	end

	def evaluate
		scratch_card_validity
	end


	private

	def scratch_card_validity

		transaction_record_sender = Transaction.where(sender_id: @user1).all
		transaction_record_receiver = Transaction.where(receiver_id: @user2).all

		yesterday_sender_transaction = transaction_record_sender.where("created_at >= :yesterday", { yesterday: Date.yesterday })
		last_month_sender_transaction = transaction_record_sender.where("created_at >= :previous_month", { previous_month: Date.today - 1.months })
		last_year_sender_transaction = transaction_record_sender.where("created_at >= :previous_year", { previous_year: Date.today - 1.years })
		byebug
		compute_transaction_last_year(last_year_sender_transaction, last_month_sender_transaction, last_month_sender_transaction)

		yesterday_receiver_transaction = transaction_record_receiver.where("created_at >= :yesterday", { yesterday: Date.yesterday })
		last_month_receiver_transaction = transaction_record_receiver.where("created_at >= :previous_month", { previous_month: Date.today - 1.months })
		last_year_receiver_transaction = transaction_record_receiver.where("created_at >= :previous_year", { previous_year: Date.today - 1.years })

		compute_receiver_transaction_last_year(last_year_receiver_transaction, last_month_receiver_transaction, last_month_receiver_transaction)

	end


	def compute_transaction_last_year(previous_year_transaction, previous_month_transaction, yesterday_transaction)
		type_of = "sender"
		scratch_card_valuation = Card.where(type_user: "Sender").all
		array = [yesterday_transaction, previous_month_transaction, previous_year_transaction]
		j = 0
		scratch_card_valuation.each do |card|
			limit = card.limit
			if(array[j].count <= limit)
				scratch_card_evaluation(card.id, type_of)
			end
			j = j + 1
		end
	end


	def compute_receiver_transaction_last_year(previous_year_transaction, previous_month_transaction, yesterday_transaction)
		type_of = "receiver"
		scratch_card_valuation = Card.where(type_user: "Receiver").all
		array = [yesterday_transaction, previous_month_transaction, previous_year_transaction]
		j = 0
		scratch_card_valuation.each do |card|
			limit = card.limit
			if(array[j].count <= limit)
				scratch_card_evaluation(card.id, type_of)
			end
			j = j + 1
		end
	end

	def scratch_card_evaluation(i, type_of)
		byebug
		scratch_card_record = Card.find_by(id: i)
		transaction_record = {}
		if (type_of == "sender")
			transaction_record = Transaction.where(sender_id: @user1).last
		else 
			transaction_record = Transaction.where(receiver_id: @user2).last
		end
		if(scratch_card_record.min_range < transaction_record.amount.to_i && scratch_card_record.max_range > transaction_record.amount.to_i )
			do_scratch_card(scratch_card_record, transaction_record, type_of)
		end
	end

	def do_scratch_card(scratch_card_record, transaction_record, type_of)
		byebug
		random_amount = rand scratch_card_record.scratch_card_min..scratch_card_record.scratch_card_max
		if (type_of == "sender")
			senderid = User.find_by(id: @user1)
			bank_associated = Bankaccount.find_by(id: senderid.bankaccounts[0].id)
		else
			receiverid = User.find_by(id: @user2)
			bank_associated = Bankaccount.find_by(id: receiverid.bankaccounts[0].id)
		end
		byebug
		balance = bank_associated.balance.to_i + random_amount
		bank_associated.balance = balance.to_s
		bank_associated.save
		Scratchcard.create!(create_scratch_card_params(transaction_record.id, bank_associated.balance))
		# Scratchcard.create!(user_id: @user1,trasaction_id: transaction_record.id, bonus_amount: bank_associated.balance)
	end

	def create_scratch_card_params(id, balance)
		@create_scratch_card_params = { user_id: @user1, trasaction_id: id, bonus_amount: balance }
	end

end