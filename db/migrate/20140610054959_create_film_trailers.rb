class CreateFilmTrailers < ActiveRecord::Migration
  def change
    create_table :film_trailers do |t|

      t.timestamps
    end
  end
end
