class AddColumnToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :source_video, :string
  end
end
