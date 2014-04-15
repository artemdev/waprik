class CreateFilmGenreThroughs < ActiveRecord::Migration
  def change
    create_table :filmss_genres_through do |t|
    	t.integer :film_id
    	t.integer :genre_id
      t.timestamps
    end
    add_index :films_genres_through, :film_id
    add_index :films_genres_through, :genre_id
  end
end
