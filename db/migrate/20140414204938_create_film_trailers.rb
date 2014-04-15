class CreateFilmTrailers < ActiveRecord::Migration
  def change
    create_table :films_trailers do |t|
    	t.integer :film_id
      t.timestamps
    end
    add_index :films_trailers, :film_id
  end
end
