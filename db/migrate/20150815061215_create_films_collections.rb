class CreateFilmsCollections < ActiveRecord::Migration
  def change
    create_table :films_collections do |t|
      t.string :name
      t.timestamps
    end
    add_index :films_collections, :name
  end
end
