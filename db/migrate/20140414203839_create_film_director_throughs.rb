class CreateFilmDirectorThroughs < ActiveRecord::Migration
  def change
    create_table :films_directors_throughs do |t|
    	t.integer :film_id
    	t.integer :director_id
      t.timestamps
    end
  end
end
