class CreateFilmActorThroughs < ActiveRecord::Migration
  def change
    create_table :films_actors_through do |t|
    	t.integer :film_id
    	t.integer :actor_id
      t.timestamps
    end
    add_index :films_actors_through, :film_id
    add_index :films_actors_through, :actor_id
  end
end
