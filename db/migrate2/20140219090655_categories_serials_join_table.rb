class CategoriesSerialsJoinTable < ActiveRecord::Migration
  def up
  	create_table :categories_serials, id: false do |t|
  		t.integer	:category_id
  		t.integer :serial_id	
  	end
  	add_index :categories_serials, ['category_id', 'serial_id']
  end

  def down
  	drop_table :categories_serials
  end
end
