class Api::V1::TransactionsController < ApplicationController

	include TransactionDocs

	def index
		render json: find_transaction
	end

	def show
		render json: show_transaction
	end

	def create 
	  create_transaction 
	  generate_scratch_card 
	  render json: create_transaction
	end

	private 

	def create_transaction
		@create_transaction =  TransactionService.new(filter_params).perform
	end

	def generate_scratch_card
		@generate_scratch_card = ScratchCardService.new(filter_params).evaluate
	end

	def find_transaction 
		Transaction.where("sender_id = ? or receiver_id  = ?", params[:user_id], params[:user_id]).all
	end

	def show_transaction 
		Transaction.find_by(id: params[:id])
	end
	def filter_params
		params.require(:transaction).permit(:sender_id,:receiver_id,:amount)
	end
end
