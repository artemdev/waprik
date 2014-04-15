class CreateFilmQualities < ActiveRecord::Migration
  def change
    create_table :films_qualities do |t|
    	t.string :title
      t.timestamps
    end
  end
end
