class AddColumnTimeToYoutubeVideos < ActiveRecord::Migration
  def change
    add_column :youtube_videos, :time, :string
    add_index :youtube_videos, :time
  end
end
