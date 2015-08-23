class AddColumnCoverToFilmsCollection < ActiveRecord::Migration
  def change
    add_column :films_collections, :cover, :string
    add_index :films_collections, :cover
  end
end
