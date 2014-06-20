class EditMp3ColumnsAfterTransfer < ActiveRecord::Migration
  def up
  	# mp3_files
  	rename_column :mp3_files, :file_id, :id
  	rename_column :mp3_files, :file_ftp_path, :ftp_path
  	rename_column :mp3_files, :file_path, :path
  	rename_column :mp3_files, :file_name, :name
  	rename_column :mp3_files, :file_fname, :fname
  	rename_column :mp3_files, :file_length, :length
  	# rename_column :mp3_files, :file_date_added, :created_at
  	rename_column :mp3_files, :file_genre_id, :genre_id
  	rename_column :mp3_files, :file_artist_id, :artist_id
  	rename_column :mp3_files, :file_album_id, :album_id
  	rename_column :mp3_files, :file_order, :order
  	rename_column :mp3_files, :file_order_nomination, :order_nomination
  	rename_column :mp3_files, :file_hit, :hit
  	# rename_column :mp3_files, :file_hit_date, :hit_date
  	rename_column :mp3_files, :file_new, :new
  	rename_column :mp3_files, :file_count_downloads, :downloads
  	# add_column :mp3_files, :created_at, :datetime

  	# mp3_artists
  	rename_column :mp3_artists, :artist_id, :id
  	rename_column :mp3_artists, :artist_first_letter, :first_letter
  	rename_column :mp3_artists, :artist_lang, :lang
  	rename_column :mp3_artists, :artist_name, :name
  	rename_column :mp3_artists, :artist_count_albums, :count_albums  	
  	rename_column :mp3_artists, :artist_count_tracks, :count_tracks 	
  	rename_column :mp3_artists, :artist_count_hits, :count_hits
  	add_column :mp3_artists, :created_at, :datetime
   	add_column :mp3_artists, :updated_at, :datetime

   	# mp3_alphabet
   	rename_column :mp3_alphabet, :alph_id, :id
   	rename_column :mp3_alphabet, :alph_isset_rus, :isset_rus
   	rename_column :mp3_alphabet, :alph_isset_eng, :isset_eng
   	rename_column :mp3_alphabet, :alph_count_hits_rus, :count_hits_rus
   	rename_column :mp3_alphabet, :alph_count_hits_eng, :count_hits_eng

   	# mp3_albums
   	rename_column :mp3_albums, :album_id, :id
   	rename_column :mp3_albums, :album_artist_id, :artist_id
   	rename_column :mp3_albums, :album_name, :name
   	rename_column :mp3_albums, :album_year, :year
   	rename_column :mp3_albums, :album_count_tracks, :count_tracks
   	remove_column :mp3_albums, :album_hit
   	remove_column :mp3_albums, :album_hit_name
  	add_column :mp3_albums, :created_at, :datetime
   	add_column :mp3_albums, :updated_at, :datetime

   	# mp3_bitrates
   	rename_column :mp3_bitrate, :bitrate_file_id, :file_id
   	rename_column :mp3_bitrate, :bitrate_file_bitrate, :file_bitrate
   	rename_column :mp3_bitrate, :bitrate_file_size, :file_size
  end

  def down
  end

end
