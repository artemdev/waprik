class RemoveNullsFromMusic < ActiveRecord::Migration
  def up
  	# mp3_files
  	change_column_null(:mp3_files, :name, true)
  	change_column_null(:mp3_files, :ftp_path, true)
  	change_column_null(:mp3_files, :path, true)
  	change_column_null(:mp3_files, :fname, true)
  	change_column_null(:mp3_files, :length, true)
  	change_column_null(:mp3_files, :created_at, true)
  	change_column_null(:mp3_files, :genre_id, true)
  	change_column_null(:mp3_files, :artist_id, true)
  	change_column_null(:mp3_files, :album_id, true)
  	change_column_null(:mp3_files, :order, true)
  	change_column_null(:mp3_files, :order_nomination, true)
  	change_column_null(:mp3_files, :hit, true)
  	change_column_null(:mp3_files, :file_hit_date, true)
  	change_column_null(:mp3_files, :new, true)
  	change_column_null(:mp3_files, :downloads, true)

  	change_column :mp3_files, :artist_id, :integer, default: nil
  	change_column :mp3_files, :album_id, :integer, default: nil
  	change_column :mp3_files, :hit, :boolean, default: 0
  	change_column :mp3_files, :new, :boolean, default: 0
  end
end
