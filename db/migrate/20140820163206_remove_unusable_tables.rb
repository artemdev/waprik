class RemoveUnusableTables < ActiveRecord::Migration
  def up
  	drop_table :mp3_nominations if table_exists? :mp3_nominations
  	drop_table :mp3_users if table_exists? :mp3_users
  	drop_table :categories_music if table_exists? :categories_music
   	drop_table :categories_news if table_exists? :categories_news
    drop_table :mp3_track2category if table_exists? :mp3_track2categoryominations
    drop_table :mp3_track2nomination if table_exists? :mp3_track2nomination
    drop_table :mp3_artist2category if table_exists? :mp3_artist2category
    drop_table :mp3_album2category if table_exists? :mp3_album2category
    drop_table :mp3_categories_video_through if table_exists? :mp3_categories_video_through
  end

  def down
  	create_table :mp3_nominations
  	create_table :mp3_users
  	create_table :categories_music
   	create_table :categories_news
    create_table :mp3_track2category
    create_table :mp3_track2nomination
    create_table :mp3_artist2category
    create_table :mp3_album2category
    create_table :mp3_categories_video_through
  end
end
