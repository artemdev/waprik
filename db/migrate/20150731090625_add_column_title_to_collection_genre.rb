class AddColumnTitleToCollectionGenre < ActiveRecord::Migration
  def change
    add_column :collection_genres, :title, :string
    add_index :collection_genres, :title
  end
end
