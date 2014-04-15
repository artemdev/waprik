class CreateFilmFormats < ActiveRecord::Migration
  def change
    create_table :films_formats do |t|
    	t.string :ext
    	t.string :title
    	t.string :description
      t.timestamps
    end
  end
end
