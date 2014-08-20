class RemoveNullsFromMp3Albums < ActiveRecord::Migration
  def up
  	change_column_null(:mp3_albums, :artist_id, true)
  	change_column_null(:mp3_albums, :name, true)
  	change_column_null(:mp3_albums, :year, true)
  	change_column_null(:mp3_albums, :count_tracks, true)
  end
end
