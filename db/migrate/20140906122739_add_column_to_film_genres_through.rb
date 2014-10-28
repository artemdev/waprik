class AddColumnToFilmGenresThrough < ActiveRecord::Migration
  def change
    add_column :films_genres_through, :genreable_type, :string
    add_index :films_genres_through, :genreable_type
    rename_column :films_genres_through, :film_id, :genreable_id
  end
end
