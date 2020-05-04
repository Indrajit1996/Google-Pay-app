class User < ApplicationRecord
	has_many :bankaccounts 
	has_many :sender , :foreign_key => 'user_id' , :class_name => "Transaction" 
	has_many :receiver , :foreign_key => 'user_id' ,:class_name => "Transaction" 
end
