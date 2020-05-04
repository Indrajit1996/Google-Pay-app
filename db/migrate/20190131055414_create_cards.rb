class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
    	t.string :period
    	t.integer :limit
    	t.integer :min_range
    	t.integer :max_range
    	t.string :type_user
    	t.integer :scratch_card_min 
    	t.integer :scratch_card_max
      t.timestamps
    end
  end
end
