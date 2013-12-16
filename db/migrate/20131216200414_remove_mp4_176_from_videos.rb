class RemoveMp4176FromVideos < ActiveRecord::Migration
  def up
  	remove_column :videos, :mp4_176
  end

  def down
  end
end
