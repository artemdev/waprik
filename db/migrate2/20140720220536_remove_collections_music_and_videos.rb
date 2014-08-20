class RemoveCollectionsMusicAndVideos < ActiveRecord::Migration
  def up
  	drop_table :collections_music
  	drop_table :collections_videos
  end
end
