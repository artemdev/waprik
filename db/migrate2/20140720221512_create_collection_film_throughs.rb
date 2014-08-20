class CreateCollectionFilmThroughs < ActiveRecord::Migration
  def change
    create_table :collection_film_throughs do |t|
      t.integer :collection_id
      t.integer :film_id
      t.timestamps
    end
    add_index :collection_film_throughs, :collection_id
    add_index :collection_film_throughs, :film_id
  end
end
