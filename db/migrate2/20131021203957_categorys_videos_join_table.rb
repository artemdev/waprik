class CategorysVideosJoinTable < ActiveRecord::Migration
  def up
  	create_table :categories_videos, :id => false do |t|
  		t.integer "category_id"
  		t.integer "video_id"
 		end
 		add_index :categories_videos, ["video_id", "category_id"]
  end

  def down
  	drop_table :categories_videos
  end
end
