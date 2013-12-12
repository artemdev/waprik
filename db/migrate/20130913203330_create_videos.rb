class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.references :category
    	t.string "description"
      t.string "screen"
    	t.string "low_3gp"
    	t.string "mp4_176"
     	t.string "mp4_320"
      t.integer "size"
     	t.string "name"
      t.string "artist"     
      t.integer "downloads", :default => 0
      t.string "source_video"
      t.timestamps
    end
    add_index :videos, "category_id"
  end
end
