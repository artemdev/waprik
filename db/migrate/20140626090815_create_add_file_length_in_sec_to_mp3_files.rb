class CreateAddFileLengthInSecToMp3Files < ActiveRecord::Migration
  def change
    add_column :mp3_files, :length_sec, :integer
  end
end
