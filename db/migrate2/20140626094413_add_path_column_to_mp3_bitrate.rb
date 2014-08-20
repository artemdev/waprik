class AddPathColumnToMp3Bitrate < ActiveRecord::Migration
  def change
    add_column :mp3_bitrate, :file, :string
  end
end
