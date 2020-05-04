class TransactionService
	def initialize(options)
		@user1 = options[:sender_id]
		@user2 = options[:receiver_id]
		@amount = options[:amount]
	end

	def perform
		add_transaction
		perform_transaction 
	end

	private

	def perform_transaction
		transaction = Transaction.create!(create_transaction_params)
	end

	def add_transaction
		byebug
		sender =  Bankaccount.find_by!(id: @user1)
		receiver = Bankaccount.find_by!(id: @user2)
		newBalance = sender.balance.to_i - @amount.to_i
		sender.balance = newBalance.to_s
		newBalanceReceiver = receiver.balance.to_i + @amount.to_i
		receiver.balance =  newBalanceReceiver.to_s
		sender.save! 
		receiver.save!
	end

	def create_transaction_params
		@create_transaction_params = {sender_id: @user1, receiver_id: @user2, amount: @amount}
	end
end