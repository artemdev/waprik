class CreateFilmActorThroughs < ActiveRecord::Migration
  def change
    create_table :films_actor_throughs do |t|
    	t.integer :film_id
    	t.integer :actor_id
      t.timestamps
    end
    add_index :film_actors_throughs, :film_id
    add_index :film_actors_throughs, :actor_id
  end
end
