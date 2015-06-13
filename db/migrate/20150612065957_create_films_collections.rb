class CreateFilmsCollections < ActiveRecord::Migration
  def change
    create_table :films_collections do |t|

      t.timestamps
    end
  end
end
