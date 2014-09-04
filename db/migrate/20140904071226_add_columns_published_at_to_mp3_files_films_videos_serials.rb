class AddColumnsPublishedAtToMp3FilesFilmsVideosSerials < ActiveRecord::Migration
  def change
  	add_column :serials, :published_at, :datetime, index: true
  	add_column :videos, :published_at, :datetime, index: true
  	add_column :films, :published_at, :datetime, index: true
  	add_column :mp3_files, :published_at, :datetime, index: true
  end
end
