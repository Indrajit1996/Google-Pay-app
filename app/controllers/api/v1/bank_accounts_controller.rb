class Api::V1::BankAccountsController < ApplicationController
	
	def index
		render json: user.bankaccounts
	end

	def show 
		render json: bank
	end

	def create
		byebug
		banks = Bankaccount.create!(bank_params)
		render json: banks
	end

	private 

	def bank
		@bank ||= Bankaccount.find_by(bank_id) 
	end

	def user
		@user ||= User.find_by(params[:user_id])
	end

	def bank_id
		params.require(:id)
	end

	def bank_params
		params.permit(:phone_number, :IFSC_code, :balance, :user_id)
	end
	def user_params
		params.require(:user_id)
	end
end


