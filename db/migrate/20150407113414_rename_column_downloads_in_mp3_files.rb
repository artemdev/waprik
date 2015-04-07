class RenameColumnDownloadsInMp3Files < ActiveRecord::Migration
  def up
  	rename_column :mp3_files, :downloads, :download
  end

  def down
  end
end
