class CreateFilmFiles < ActiveRecord::Migration
  def change
    create_table :films_files do |t|
    	t.integer :film_id
    	t.integer :format_id
    	t.string :title
    	t.string :real_name
    	t.integer :size
    	t.string :ext
      t.timestamps
    end
    add_index :films_files, :film_id
    add_index :films_files, :format_id
    add_index :films_files, :ext
    add_index :films_files, :size
  end
end
