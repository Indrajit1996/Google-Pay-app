class CreateScratchcards < ActiveRecord::Migration[5.2]
  def change
    create_table :scratchcards do |t|
    	t.integer :user_id
    	t.integer :trasaction_id
    	t.integer :bonus_amount
      t.timestamps
    end
  end
end
