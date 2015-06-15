class CreateCollectionGenreThroughs < ActiveRecord::Migration
  def change
    create_table :collection_genre_throughs do |t|
      t.string :collection_id
      t.string :genre_id

      t.timestamps
    end
    add_index :collection_genre_throughs, :collection_id
    add_index :collection_genre_throughs, :genre_id
  end
end
