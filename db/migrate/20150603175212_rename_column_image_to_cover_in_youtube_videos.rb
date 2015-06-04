class RenameColumnImageToCoverInYoutubeVideos < ActiveRecord::Migration
  def up
  	rename_column :youtube_videos, :image, :cover
  end

  def down
  	rename_column :youtube_videos, :cover, :image
  end
end
