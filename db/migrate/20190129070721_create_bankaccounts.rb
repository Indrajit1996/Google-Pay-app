class CreateBankaccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bankaccounts do |t|
    	t.string :phone_number 
    	t.string :IFSC_code
    	t.string :balance
    	t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
