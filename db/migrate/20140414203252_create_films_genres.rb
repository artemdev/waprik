class CreateFilmsGenres < ActiveRecord::Migration
  def change
    create_table :films_genres do |t|
    	t.string :title
      t.timestamps
    end
  end
end
