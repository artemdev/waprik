class CreateMp3 < ActiveRecord::Migration
  def change
    create_table :mp3_files, id: false do |t|
      t.integer :file_id
      t.string :file_ftp_path
      t.string :file_path
      t.string :file_name
      t.string :file_fname
      t.string :file_length
      t.datetime :file_date_added
      t.integer :file_genre_id
      t.integer :file_artist_id
      t.integer :file_album_id
      t.integer :file_order
      t.integer :file_order_nomination
      t.boolean :file_hit
      t.datetime :file_hit_date
      t.boolean :file_new
      t.integer :file_count_downloads
      t.timestamps
    end

    create_table :mp3_artists, id: false do |t|
      t.integer :artist_id
      t.string :artist_name
      t.string :artist_first_letter
      t.string :artist_lang
      t.integer :artist_count_albums
      t.integer :artist_count_tracks
      t.integer :artist_count_hits
    end

    create_table :mp3_alphabet, id: false do |t|
      t.integer :alph_id
      t.integer :alph_isset_rus
      t.integer :alph_isset_eng
      t.integer :alph_count_hits_rus
      t.integer :alph_count_hits_eng
    end

    create_table :mp3_albums, id: false do |t|
      t.integer :album_id
      t.integer :album_artist_id
      t.string :album_name
      t.integer :album_year
      t.integer :album_count_tracks
    end

    create_table :mp3_bitrate, id: false do |t|
      t.integer :bitrate_file_id
      t.integer :bitrate_file_bitrate
      t.string :bitrate_file_size
    end
  end
end
