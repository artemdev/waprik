class CreateFilmTranslations < ActiveRecord::Migration
  def change
    create_table :films_translations do |t|
    	t.string :title
      t.timestamps
    end
  end
end
