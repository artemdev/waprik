class AddFileLengthInSecToMp3File < ActiveRecord::Migration
  def change
  	add_column :mp3_files, :length_sec, :integer
  end
end
