class AddColumnCollectionGenreIdToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :collection_genre_id, :integer
    add_index :collections, :collection_genre_id
  end
end
