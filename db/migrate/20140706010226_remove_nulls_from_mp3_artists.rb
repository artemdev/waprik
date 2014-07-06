class RemoveNullsFromMp3Artists < ActiveRecord::Migration
  def change
  	# mp3_artists
  	change_column_null(:mp3_artists, :name, true)
  	change_column_null(:mp3_artists, :first_letter, true)
  	change_column_null(:mp3_artists, :lang, true)
  	change_column_null(:mp3_artists, :count_albums, true)
  	change_column_null(:mp3_artists, :count_tracks, true)
  	change_column_null(:mp3_artists, :count_hits, true)
  end
end
