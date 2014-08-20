class MusicCollectionsJoiner < ActiveRecord::Migration
  def up
  	create_table :collections_music, :id => false do |t|
  		t.integer "music_id"
  		t.integer "collection_id"
  	end
  	add_index :collections_music, ["music_id", "collection_id"]
  end

  def down
  	drop_table :collections_music
  end
end
