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

ActiveRecord::Schema.define(:version => 20140415083926) do

  create_table "admin_users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "attachments", :force => true do |t|
    t.integer  "series_id"
    t.string   "mp4_640"
    t.integer  "count_mp4_640"
    t.string   "mp4_320"
    t.integer  "count_mp4_320"
    t.string   "low_3gp"
    t.integer  "count_low_3gp"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "attachments", ["series_id"], :name => "index_attachments_on_series_id"

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
    t.integer "item_id",                           :null => false
    t.string  "title",              :limit => 100, :null => false
    t.integer "user_id",                           :null => false
    t.boolean "is_favourite",                      :null => false
    t.text    "about",                             :null => false
    t.integer "duration_hours",     :limit => 1,   :null => false
    t.integer "duration_minutes",   :limit => 1,   :null => false
    t.integer "duration_seconds",   :limit => 1,   :null => false
    t.integer "time",                              :null => false
    t.integer "downloads",                         :null => false
    t.string  "world_estimate",     :limit => 10,  :null => false
    t.string  "cis_estimate",       :limit => 10,  :null => false
    t.integer "last_download_time",                :null => false
    t.string  "prepare_status",     :limit => 100, :null => false
    t.string  "file_name",                         :null => false
    t.integer "month",              :limit => 1,   :null => false
    t.integer "year",               :limit => 2,   :null => false
    t.integer "quality_id",                        :null => false
    t.integer "translation_id",                    :null => false
    t.integer "count_likes",                       :null => false
    t.integer "count_comments",                    :null => false
    t.integer "news_time",                         :null => false
  end

  add_index "films", ["count_comments"], :name => "count_comments"
  add_index "films", ["count_likes"], :name => "count_likes"
  add_index "films", ["downloads"], :name => "downloads"
  add_index "films", ["is_favourite"], :name => "is_favourite"
  add_index "films", ["item_id"], :name => "item_id"
  add_index "films", ["last_download_time"], :name => "last_download_time"
  add_index "films", ["month"], :name => "month"
  add_index "films", ["news_time"], :name => "news_time"
  add_index "films", ["quality_id"], :name => "quality_id"
  add_index "films", ["time"], :name => "time"
  add_index "films", ["title"], :name => "title"
  add_index "films", ["translation_id"], :name => "translation_id"
  add_index "films", ["user_id"], :name => "user_id"
  add_index "films", ["year"], :name => "year"

  create_table "films_actors", :force => true do |t|
    t.string "name", :limit => 100, :null => false
  end

  create_table "films_actors_through", :id => false, :force => true do |t|
    t.integer "film_id",  :null => false
    t.integer "actor_id", :null => false
  end

  add_index "films_actors_through", ["film_id", "actor_id"], :name => "film_id", :unique => true

  create_table "films_directors", :force => true do |t|
    t.string "name", :limit => 100, :null => false
  end

  create_table "films_directors_through", :id => false, :force => true do |t|
    t.integer "film_id",     :null => false
    t.integer "director_id", :null => false
  end

  add_index "films_directors_through", ["film_id", "director_id"], :name => "film_id", :unique => true

  create_table "films_files", :force => true do |t|
    t.integer "film_id",                 :null => false
    t.integer "format_id",               :null => false
    t.string  "title",     :limit => 50, :null => false
    t.string  "real_name",               :null => false
    t.integer "size",                    :null => false
    t.string  "ext",       :limit => 10, :null => false
    t.integer "position",  :limit => 2,  :null => false
  end

  add_index "films_files", ["ext"], :name => "ext"
  add_index "films_files", ["film_id"], :name => "film_id"
  add_index "films_files", ["format_id"], :name => "format_id"
  add_index "films_files", ["position"], :name => "position"
  add_index "films_files", ["size"], :name => "size"

  create_table "films_formats", :force => true do |t|
    t.string "title",       :limit => 100,  :null => false
    t.string "description", :limit => 100,  :null => false
    t.string "ffparams",    :limit => 1000, :null => false
    t.string "ext",         :limit => 10,   :null => false
  end

  create_table "films_genres", :force => true do |t|
    t.string "title", :limit => 100, :null => false
  end

  create_table "films_genres_through", :id => false, :force => true do |t|
    t.integer "film_id",  :null => false
    t.integer "genre_id", :null => false
  end

  add_index "films_genres_through", ["film_id", "genre_id"], :name => "film_id", :unique => true

  create_table "films_parts", :force => true do |t|
    t.integer "num",       :null => false
    t.integer "file_id",   :null => false
    t.integer "film_id",   :null => false
    t.integer "format_id", :null => false
    t.string  "real_name", :null => false
    t.integer "duration",  :null => false
    t.integer "size",      :null => false
    t.integer "downloads", :null => false
  end

  add_index "films_parts", ["downloads"], :name => "downloads"
  add_index "films_parts", ["file_id"], :name => "file_id"
  add_index "films_parts", ["film_id"], :name => "film_id"
  add_index "films_parts", ["format_id"], :name => "format_id"
  add_index "films_parts", ["num"], :name => "num"

  create_table "films_qualities", :force => true do |t|
    t.string  "title",    :limit => 50, :null => false
    t.integer "position",               :null => false
  end

  create_table "films_trailers", :force => true do |t|
    t.integer "film_id",                :null => false
    t.string  "filename", :limit => 50, :null => false
    t.integer "filesize",               :null => false
  end

  create_table "films_translations", :force => true do |t|
    t.string  "title",    :limit => 50, :null => false
    t.integer "position",               :null => false
  end

  create_table "music", :force => true do |t|
    t.boolean  "hit"
    t.integer  "downloads"
    t.string   "name"
    t.string   "link_orig"
    t.string   "link_128"
    t.string   "link_64"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "description", :limit => 1000
    t.string   "section"
    t.boolean  "visible"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "title"
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.integer  "downloads",   :default => 0
    t.string   "description"
    t.integer  "author_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.boolean  "erotic"
  end

  add_index "pictures", ["author_id"], :name => "index_pictures_on_author_id"

  create_table "serials", :force => true do |t|
    t.string   "description"
    t.integer  "season"
    t.boolean  "updating",    :default => true
    t.string   "name"
    t.string   "cover"
    t.boolean  "hit"
    t.string   "years"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "series", :force => true do |t|
    t.integer  "serial_id"
    t.string   "name"
    t.string   "release_date"
    t.integer  "number"
    t.string   "mp4_640"
    t.integer  "dl_mp4_640",   :default => 0
    t.string   "mp4_320"
    t.integer  "dl_mp4_320",   :default => 0
    t.string   "low_3gp"
    t.integer  "dl_low_3gp",   :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "series", ["serial_id"], :name => "index_series_on_serial_id"

  create_table "soul_operas", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "category_id"
    t.string   "description"
    t.string   "screen"
    t.string   "low_3gp"
    t.string   "mp4_320"
    t.integer  "size"
    t.string   "name"
    t.string   "artist"
    t.integer  "downloads",    :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "source_video"
    t.string   "mp4_640"
  end

  add_index "videos", ["category_id"], :name => "index_videos_on_category_id"

end
