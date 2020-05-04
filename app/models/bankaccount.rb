class Bankaccount < ApplicationRecord
	belongs_to :user

	validates :balance ,presence: true , :format => { :with => /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/,
    :message => " is not a valid size", :multiline => true } 

	
end