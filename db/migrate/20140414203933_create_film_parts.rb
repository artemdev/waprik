class CreateFilmParts < ActiveRecord::Migration
  def change
    create_table :films_parts do |t|
    	t.integer :film_id
    	t.integer :file_id
    	t.integer :format_id
    	t.integer :duration
    	t.integer :size
    	t.integer :downloads
    	t.integer :num
    	t.string :real_name
      t.timestamps
    end
    add_index :films_parts, :film_id
    add_index :films_parts, :file_id
    add_index :films_parts, :format_id
    add_index :films_parts, :downloads
    add_index :films_parts, :num
  end
end
