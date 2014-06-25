# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140618120926) do

  create_table "admin_users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "for_videos",       :default => false
    t.boolean  "for_serials",      :default => false
    t.boolean  "for_news"
    t.boolean  "for_music"
    t.integer  "categorable_id"
    t.string   "categorable_type"
    t.boolean  "for_pictures"
  end

  create_table "categories_music", :id => false, :force => true do |t|
    t.integer "music_id"
    t.integer "category_id"
  end

  add_index "categories_music", ["music_id", "category_id"], :name => "index_categories_music_on_music_id_and_category_id"

  create_table "categories_news", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "news_id"
  end

  add_index "categories_news", ["news_id", "category_id"], :name => "index_categories_news_on_news_id_and_category_id"

  create_table "categories_serials", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "serial_id"
  end

  add_index "categories_serials", ["category_id", "serial_id"], :name => "index_categories_serials_on_category_id_and_serial_id"

  create_table "categories_videos", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "video_id"
  end

  add_index "categories_videos", ["video_id", "category_id"], :name => "index_categories_videos_on_video_id_and_category_id"

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.boolean  "hit",         :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "with_videos", :default => false
    t.boolean  "with_music",  :default => false
  end

  create_table "collections_music", :id => false, :force => true do |t|
    t.integer "music_id"
    t.integer "collection_id"
  end

  add_index "collections_music", ["music_id", "collection_id"], :name => "index_collections_music_on_music_id_and_collection_id"

  create_table "collections_videos", :id => false, :force => true do |t|
    t.integer "video_id"
    t.integer "collection_id"
  end

  add_index "collections_videos", ["video_id", "collection_id"], :name => "index_collections_videos_on_video_id_and_collection_id"

  create_table "feedbacks", :force => true do |t|
    t.string   "description"
    t.string   "answer"
    t.string   "type"
    t.string   "sender"
    t.boolean  "published"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "feedbacks", ["type"], :name => "index_feedbacks_on_type"

  create_table "films", :force => true do |t|
    t.integer  "item_id"
    t.string   "title",              :limit => 100
    t.integer  "user_id"
    t.boolean  "is_favourite"
    t.text     "about"
    t.integer  "duration_hours",     :limit => 1
    t.integer  "duration_minutes",   :limit => 1
    t.integer  "duration_seconds",   :limit => 1
    t.integer  "time"
    t.integer  "downloads",                         :default => 0
    t.string   "world_estimate",     :limit => 10
    t.string   "cis_estimate",       :limit => 10
    t.integer  "last_download_time"
    t.string   "prepare_status",     :limit => 100
    t.string   "file_name"
    t.integer  "month",              :limit => 1
    t.integer  "year",               :limit => 2
    t.integer  "quality_id"
    t.integer  "translation_id"
    t.integer  "count_likes"
    t.integer  "count_comments"
    t.integer  "created_at",                                       :null => false
    t.datetime "updated_at"
    t.string   "cover"
  end

  add_index "films", ["count_comments"], :name => "count_comments"
  add_index "films", ["count_likes"], :name => "count_likes"
  add_index "films", ["cover"], :name => "index_films_on_cover"
  add_index "films", ["created_at"], :name => "news_time"
  add_index "films", ["downloads"], :name => "downloads"
  add_index "films", ["is_favourite"], :name => "is_favourite"
  add_index "films", ["item_id"], :name => "item_id"
  add_index "films", ["last_download_time"], :name => "last_download_time"
  add_index "films", ["month"], :name => "month"
  add_index "films", ["quality_id"], :name => "quality_id"
  add_index "films", ["time"], :name => "time"
  add_index "films", ["title"], :name => "title"
  add_index "films", ["translation_id"], :name => "translation_id"
  add_index "films", ["user_id"], :name => "user_id"
  add_index "films", ["year"], :name => "year"

  create_table "films_actors", :force => true do |t|
    t.string   "name",       :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_actors_through", :id => false, :force => true do |t|
    t.integer  "film_id"
    t.integer  "actor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "films_actors_through", ["film_id", "actor_id"], :name => "film_id", :unique => true

  create_table "films_directors", :force => true do |t|
    t.string "name", :limit => 100
  end

  create_table "films_directors_through", :id => false, :force => true do |t|
    t.integer  "film_id"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "films_directors_through", ["film_id", "director_id"], :name => "film_id", :unique => true

  create_table "films_files", :force => true do |t|
    t.integer  "film_id"
    t.integer  "format_id"
    t.string   "title",      :limit => 50
    t.string   "real_name"
    t.integer  "size"
    t.string   "ext",        :limit => 10
    t.integer  "position",   :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "films_files", ["ext"], :name => "ext"
  add_index "films_files", ["film_id"], :name => "film_id"
  add_index "films_files", ["format_id"], :name => "format_id"
  add_index "films_files", ["position"], :name => "position"
  add_index "films_files", ["size"], :name => "size"

  create_table "films_formats", :force => true do |t|
    t.string   "title",       :limit => 100,  :null => false
    t.string   "description", :limit => 100,  :null => false
    t.string   "ffparams",    :limit => 1000, :null => false
    t.string   "ext",         :limit => 10,   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_genres", :force => true do |t|
    t.string   "title",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_genres_through", :id => false, :force => true do |t|
    t.integer  "film_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "films_genres_through", ["film_id", "genre_id"], :name => "film_id", :unique => true

  create_table "films_parts", :force => true do |t|
    t.integer  "num"
    t.integer  "file_id"
    t.integer  "film_id"
    t.integer  "format_id"
    t.string   "real_name"
    t.integer  "duration"
    t.integer  "size"
    t.integer  "downloads"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "films_parts", ["downloads"], :name => "downloads"
  add_index "films_parts", ["file_id"], :name => "file_id"
  add_index "films_parts", ["film_id"], :name => "film_id"
  add_index "films_parts", ["format_id"], :name => "format_id"
  add_index "films_parts", ["num"], :name => "num"

  create_table "films_qualities", :force => true do |t|
    t.string   "title",      :limit => 50
    t.integer  "position",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_trailers", :force => true do |t|
    t.integer  "film_id",                  :null => false
    t.string   "filename",   :limit => 50, :null => false
    t.integer  "filesize",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_translations", :force => true do |t|
    t.string   "title",      :limit => 50
    t.integer  "position",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mp3_album2category", :id => false, :force => true do |t|
    t.integer "al2c_album_id",    :null => false
    t.integer "al2c_category_id", :null => false
  end

  add_index "mp3_album2category", ["al2c_album_id"], :name => "file_id"
  add_index "mp3_album2category", ["al2c_category_id"], :name => "category_id"

  create_table "mp3_albums", :force => true do |t|
    t.integer  "artist_id",                         :default => 0,      :null => false
    t.string   "name",               :limit => 256,                     :null => false
    t.string   "year",               :limit => 4,   :default => "0000", :null => false
    t.integer  "count_tracks",                      :default => 0,      :null => false
    t.text     "album_comment_up"
    t.text     "album_comment_down"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mp3_albums", ["artist_id"], :name => "album_artist_id"

  create_table "mp3_alphabet", :force => true do |t|
    t.integer "isset_rus",      :default => 0, :null => false
    t.integer "isset_eng",      :default => 0, :null => false
    t.integer "count_hits_rus", :default => 0, :null => false
    t.integer "count_hits_eng", :default => 0, :null => false
  end

  add_index "mp3_alphabet", ["isset_eng"], :name => "alph_isset_eng"
  add_index "mp3_alphabet", ["isset_rus"], :name => "alph_isset_rus"

  create_table "mp3_artist2category", :id => false, :force => true do |t|
    t.integer "a2c_artist_id",   :null => false
    t.integer "a2c_category_id", :null => false
  end

  add_index "mp3_artist2category", ["a2c_artist_id"], :name => "file_id"
  add_index "mp3_artist2category", ["a2c_category_id"], :name => "category_id"

  create_table "mp3_artists", :force => true do |t|
    t.string   "name",                :limit => 256,                :null => false
    t.string   "first_letter",        :limit => 1,                  :null => false
    t.string   "lang",                :limit => 3,                  :null => false
    t.integer  "count_albums",                       :default => 0, :null => false
    t.integer  "count_tracks",                       :default => 0, :null => false
    t.integer  "count_hits",          :limit => 1,   :default => 0, :null => false
    t.text     "artist_comment_up"
    t.text     "artist_comment_down"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mp3_artists", ["first_letter"], :name => "artist_first_letter"
  add_index "mp3_artists", ["lang"], :name => "artist_lang"

  create_table "mp3_bitrate", :id => false, :force => true do |t|
    t.integer "file_id",                    :null => false
    t.integer "file_bitrate",               :null => false
    t.string  "file_size",    :limit => 16, :null => false
  end

  add_index "mp3_bitrate", ["file_id"], :name => "bitrate_file_id"

  create_table "mp3_category", :primary_key => "category_id", :force => true do |t|
    t.integer "category_parent_id",                   :default => 0, :null => false
    t.string  "category_name",         :limit => 256,                :null => false
    t.text    "category_comment_up"
    t.text    "category_comment_down"
  end

  add_index "mp3_category", ["category_parent_id"], :name => "category_parent_id"

  create_table "mp3_files", :force => true do |t|
    t.string    "ftp_path",          :limit => 256,                      :null => false
    t.string    "path",              :limit => 256,                      :null => false
    t.string    "name",              :limit => 256,                      :null => false
    t.string    "fname",             :limit => 256,                      :null => false
    t.string    "length",            :limit => 5,   :default => "00:00", :null => false
    t.timestamp "created_at",                                            :null => false
    t.integer   "genre_id",                                              :null => false
    t.integer   "artist_id",                        :default => 0,       :null => false
    t.integer   "album_id",                         :default => 0,       :null => false
    t.integer   "order",                                                 :null => false
    t.integer   "order_nomination",                 :default => 0,       :null => false
    t.string    "hit",               :limit => 1,   :default => "0",     :null => false
    t.timestamp "file_hit_date"
    t.string    "new",               :limit => 1,   :default => "0",     :null => false
    t.integer   "downloads",                        :default => 0,       :null => false
    t.text      "file_comment_up"
    t.text      "file_comment_down"
  end

  add_index "mp3_files", ["album_id"], :name => "file_album_id"
  add_index "mp3_files", ["artist_id"], :name => "file_artist_id"
  add_index "mp3_files", ["created_at"], :name => "file_date_added"
  add_index "mp3_files", ["downloads"], :name => "file_count_downloads"
  add_index "mp3_files", ["file_hit_date"], :name => "file_hit_date"
  add_index "mp3_files", ["ftp_path"], :name => "file_ftp_name", :unique => true
  add_index "mp3_files", ["genre_id"], :name => "file_category_id"
  add_index "mp3_files", ["order"], :name => "file_order"
  add_index "mp3_files", ["order_nomination"], :name => "file_order_nomination"

  create_table "mp3_genres", :primary_key => "genre_id", :force => true do |t|
    t.string  "genre_name",         :limit => 256,                :null => false
    t.integer "genre_count_tracks",                :default => 0, :null => false
    t.text    "genre_comment_up"
    t.text    "genre_comment_down"
  end

  create_table "mp3_nomination", :primary_key => "nomination_id", :force => true do |t|
    t.string "nomination_name",         :limit => 256, :null => false
    t.text   "nomination_comment_up"
    t.text   "nomination_comment_down"
  end

  create_table "mp3_track2category", :id => false, :force => true do |t|
    t.integer "t2c_file_id",     :null => false
    t.integer "t2c_category_id", :null => false
  end

  add_index "mp3_track2category", ["t2c_category_id"], :name => "category_id"
  add_index "mp3_track2category", ["t2c_file_id"], :name => "file_id"

  create_table "mp3_track2nomination", :id => false, :force => true do |t|
    t.integer   "t2n_file_id",       :null => false
    t.integer   "t2n_nomination_id", :null => false
    t.timestamp "t2n_date_start",    :null => false
    t.timestamp "t2n_date_end"
  end

  add_index "mp3_track2nomination", ["t2n_file_id"], :name => "file_id"
  add_index "mp3_track2nomination", ["t2n_nomination_id"], :name => "nomination_id"

  create_table "mp3_users", :primary_key => "user_id", :force => true do |t|
    t.string "user_login",    :limit => 256, :null => false
    t.string "user_password", :limit => 32,  :null => false
  end

  add_index "mp3_users", ["user_login"], :name => "user_login", :unique => true

end
