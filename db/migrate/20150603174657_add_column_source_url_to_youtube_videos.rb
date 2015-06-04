class AddColumnSourceUrlToYoutubeVideos < ActiveRecord::Migration
  def change
    add_column :youtube_videos, :source_url, :string
    add_index :youtube_videos, :source_url
  end
end
