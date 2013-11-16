class CollectionsVideosJoiner < ActiveRecord::Migration
  def up
  	create_table :collections_videos, :id => false do |t|
  		t.integer "video_id"
  		t.integer "collection_id"
  	end
  	add_index :collections_videos, ["video_id", "collection_id"]
  end

  def down
  	drop_table :collections_videos
  end
end
