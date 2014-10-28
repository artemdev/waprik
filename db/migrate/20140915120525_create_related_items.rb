class CreateRelatedItems < ActiveRecord::Migration
  def change
    create_table :related_items do |t|
      t.integer :source_item_id
      t.integer :related_item_id

      t.timestamps
    end
    add_index :related_items, :source_item_id
    add_index :related_items, :related_item_id
  end
end
