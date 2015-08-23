class AddColumnDescriptionFilmsCollections < ActiveRecord::Migration
  def change
    add_column :films_collections, :description, :string
    add_index :films_collections, :description
  end
end
