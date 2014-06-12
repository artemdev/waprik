class AddContentTypesToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :with_videos, :boolean, default: false
    add_column :collections, :with_music, :boolean, default: false
  end
end
