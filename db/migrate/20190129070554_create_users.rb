class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :phone_number
    	t.string :email_id
    	t.string :name
      t.timestamps
    end
  end
end