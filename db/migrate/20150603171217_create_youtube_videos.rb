class CreateYoutubeVideos < ActiveRecord::Migration
  def change
    create_table :youtube_videos do |t|
      t.string :name
      t.string :description
      t.integer :views
      t.string :image

      t.timestamps
    end
    add_index :youtube_videos, :name
    add_index :youtube_videos, :description
    add_index :youtube_videos, :views
    add_index :youtube_videos, :image
  end
end
