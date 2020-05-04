class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
    	t.references :sender
    	t.references :receiver
    	t.string :amount
      t.timestamps
    end
  end
end
