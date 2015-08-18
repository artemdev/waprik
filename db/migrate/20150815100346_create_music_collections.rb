class CreateMusicCollections < ActiveRecord::Migration
  def change
    create_table :music_collections do |t|
    	t.string :name
      t.timestamps
    end

    add_index :music_collections, :name
  end
end
