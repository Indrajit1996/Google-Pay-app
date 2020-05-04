module TransactionDocs
	extend Apipie::DSL::Concern

	def self.superclass
        Api::V1::TransactionsController
    end

    resource_description do
        resource_id 'Transactions'

        short " add Transactions and view them"
        formats ["json"]
        error 404, "transaction not found"
        error 401, "Unauthorized"
        error 403, "Forbidden"
        error 422, "Unable to process request, please check error message"
        description <<-EOS
        Google pay transactions for both sender and receiver.Each transaction records a debit or credit ,
        withdrawal results in the amount reduced from the sender's bank account and amount increased in 
        receiver's bank account.
        EOS
    end

    api :POST, "api/v1/transactions", "Create Transactions "
    returns :code => 200, :desc => "Status of transactions"
    description <<-EOS
    Record to create transaction.
		EOS
    example <<-EOS
		Request: 
		POST api/v1/transactions
		{
			"sender_id": 10,
			"receiver_id": 11,
			"amount": "100"
		}
		Response:

    HTTP Status Code: 200
    body :
    {
	    "id": 28,
	    "sender_id": 10,
	    "receiver_id": 11,
	    "amount": "100",
	    "created_at": "2019-02-11T07:40:33.039Z",
	    "updated_at": "2019-02-11T07:40:33.039Z"
		}	
		EOS

		api :GET, "api/v1/users/10/bankaccounts/7/transactions/27", "Show transactions"
		returns :code => 200, :desc => "Status of transactions"
		example <<-EOS
		Request: 
		GET api/v1/users/10/bankaccounts/7/transactions/27
		
		Response:

		HTTP Status Code: 200
		body :
		{
		  "id": 27,
		  "sender_id": 10,
		  "receiver_id": 11,
		  "amount": "100",
		  "created_at": "2019-02-11T07:02:38.921Z",
		  "updated_at": "2019-02-11T07:02:38.921Z"
		}
		EOS

		api :GET, "api/v1/users/10/bankaccounts/7/transactions", "Index of all transactions"
		returns :code => 200, :desc => "Status of transactions"
		example <<-EOS
		Request: 
		GET api/v1/users/10/bankaccounts/7/transactions/27
		
		Response:

		HTTP Status Code: 200
		body :
		[
			{
				"id":11,"sender_id":10,
				"receiver_id":11,
				"amount":"100",
				"created_at":"2019-02-08T08:09:11.234Z",
				"updated_at":"2019-02-08T08:09:11.234Z"
			},
			{
				"id":12,
				"sender_id":10,
				"receiver_id":11,
				"amount":"100",
				"created_at":"2019-02-08T08:14:53.223Z",
				"updated_at":"2019-02-08T08:14:53.223Z"
			},
			{
				"id":13,
				"sender_id":10,
				"receiver_id":11,
				"amount":"100",
				"created_at":"2019-02-08T08:15:48.604Z",
				"updated_at":"2019-02-08T08:15:48.604Z"
			},
			{
				"id":14,
				"sender_id":10,
				"receiver_id":11,
				"amount":"100",
				"created_at":"2019-02-08T08:19:47.595Z",
				"updated_at":"2019-02-08T08:19:47.595Z"
			},
			{
				"id":15,
				"sender_id":10,
				"receiver_id":11,
				"amount":"100",
				"created_at":"2019-02-08T08:25:13.912Z",
				"updated_at":"2019-02-08T08:25:13.912Z"
			}]
		EOS
end
