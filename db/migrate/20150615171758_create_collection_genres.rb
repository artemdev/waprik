class CreateCollectionGenres < ActiveRecord::Migration
  def change
    create_table :collection_genres do |t|

      t.timestamps
    end
  end
end
