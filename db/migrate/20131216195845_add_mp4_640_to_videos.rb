class AddMp4640ToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :mp4_640, :string
  end
end
