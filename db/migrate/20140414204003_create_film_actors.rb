class CreateFilmActors < ActiveRecord::Migration
  def change
    create_table :films_actors do |t|
    	t.string :name
      t.timestamps
    end
    add_index :films_actors, :name
  end
end
