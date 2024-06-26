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

ActiveRecord::Schema.define(:version => 20150823123125) do

  create_table "add_column_recomendation_list_id_to_films", :force => true do |t|
    t.integer  "recomendation_list_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "admin_replies", :force => true do |t|
    t.integer  "replyable_id"
    t.string   "replyable_type"
    t.text     "content"
    t.integer  "admin_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "admin_replies", ["admin_id"], :name => "index_admin_replies_on_admin_id"
  add_index "admin_replies", ["content"], :name => "index_admin_replies_on_content"
  add_index "admin_replies", ["replyable_id"], :name => "index_admin_replies_on_replyable_id"
  add_index "admin_replies", ["replyable_type"], :name => "index_admin_replies_on_replyable_type"

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
    t.integer  "vk_user_id"
    t.string   "vk_access_token"
    t.string   "vk_code"
    t.boolean  "admin"
  end

  add_index "admin_users", ["admin"], :name => "index_admin_users_on_admin"

  create_table "ads_links", :force => true do |t|
    t.string   "title"
    t.string   "to"
    t.string   "from"
    t.datetime "expires_at"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "amount",     :default => 0
  end

  add_index "ads_links", ["amount"], :name => "index_ads_links_on_amount"
  add_index "ads_links", ["expires_at"], :name => "index_ads_links_on_expires_at"
  add_index "ads_links", ["from"], :name => "index_ads_links_on_from"
  add_index "ads_links", ["title"], :name => "index_ads_links_on_title"

  create_table "authentications", :force => true do |t|
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "collection_film_throughs", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "film_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "collection_film_throughs", ["collection_id"], :name => "index_collection_film_throughs_on_collection_id"
  add_index "collection_film_throughs", ["film_id"], :name => "index_collection_film_throughs_on_film_id"

  create_table "collection_genre_throughs", :force => true do |t|
    t.string   "collection_id"
    t.string   "genre_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "collection_genre_throughs", ["collection_id"], :name => "index_collection_genre_throughs_on_collection_id"
  add_index "collection_genre_throughs", ["genre_id"], :name => "index_collection_genre_throughs_on_genre_id"

  create_table "collection_genres", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "collection_genres", ["title"], :name => "index_collection_genres_on_title"

  create_table "collection_music_throughs", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "track_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "collection_music_throughs", ["collection_id"], :name => "index_collection_music_throughs_on_collection_id"
  add_index "collection_music_throughs", ["track_id"], :name => "index_collection_music_throughs_on_track_id"

  create_table "collection_video_throughs", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "video_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "collection_video_throughs", ["collection_id"], :name => "index_collection_video_throughs_on_collection_id"
  add_index "collection_video_throughs", ["video_id"], :name => "index_collection_video_throughs_on_video_id"

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.boolean  "hit",                 :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "with_videos",         :default => false
    t.boolean  "with_music",          :default => false
    t.string   "description"
    t.string   "image"
    t.string   "permalink"
    t.string   "vk_title"
    t.string   "full_sound"
    t.string   "source_url"
    t.integer  "collection_genre_id"
  end

  add_index "collections", ["collection_genre_id"], :name => "index_collections_on_collection_genre_id"
  add_index "collections", ["description"], :name => "index_collections_on_description"
  add_index "collections", ["full_sound"], :name => "index_collections_on_full_sound"
  add_index "collections", ["image"], :name => "index_collections_on_image"
  add_index "collections", ["permalink"], :name => "index_collections_on_permalink"
  add_index "collections", ["source_url"], :name => "index_collections_on_source_url"

  create_table "downloads", :force => true do |t|
    t.integer  "downloadable_id"
    t.string   "downloadable_type"
    t.string   "user_agent"
    t.datetime "created_at"
  end

  create_table "faces", :force => true do |t|
    t.integer  "instagram_id"
    t.integer  "vk_id"
    t.integer  "fb_id"
    t.integer  "sex",          :default => 0
    t.integer  "views",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faces", ["fb_id"], :name => "index_faces_on_fb_id"
  add_index "faces", ["instagram_id"], :name => "index_faces_on_instagram_id"
  add_index "faces", ["sex"], :name => "index_faces_on_sex"
  add_index "faces", ["views"], :name => "index_faces_on_views"
  add_index "faces", ["vk_id"], :name => "index_faces_on_vk_id"

  create_table "feedbacks", :force => true do |t|
    t.string   "description"
    t.string   "answer"
    t.string   "category"
    t.string   "sender"
    t.boolean  "published"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "feedbacks", ["category"], :name => "index_feedbacks_on_type"

  create_table "films", :force => true do |t|
    t.integer  "item_id"
    t.string   "title",                 :limit => 100
    t.integer  "user_id"
    t.boolean  "is_favourite"
    t.text     "about"
    t.integer  "duration_hours",        :limit => 1
    t.integer  "duration_minutes",      :limit => 1
    t.integer  "duration_seconds",      :limit => 1
    t.integer  "time"
    t.integer  "download",                             :default => 0
    t.string   "world_estimate",        :limit => 10
    t.string   "cis_estimate",          :limit => 10
    t.integer  "last_download_time"
    t.string   "prepare_status",        :limit => 100
    t.string   "file_name"
    t.integer  "month",                 :limit => 1
    t.integer  "year",                  :limit => 2
    t.integer  "quality_id"
    t.integer  "translation_id"
    t.integer  "count_likes"
    t.integer  "count_comments"
    t.datetime "created_at",                                          :null => false
    t.string   "cover"
    t.datetime "updated_at"
    t.string   "permalink"
    t.string   "ru_title"
    t.string   "en_title"
    t.boolean  "visible"
    t.boolean  "blocked"
    t.boolean  "broken"
    t.datetime "published_at"
    t.string   "brb_url"
    t.integer  "recomendation_list_id"
    t.string   "torrent"
    t.boolean  "vk"
    t.string   "youtube_link"
  end

  add_index "films", ["blocked"], :name => "index_films_on_blocked"
  add_index "films", ["count_comments"], :name => "count_comments"
  add_index "films", ["count_likes"], :name => "count_likes"
  add_index "films", ["cover"], :name => "index_films_on_cover"
  add_index "films", ["created_at"], :name => "news_time"
  add_index "films", ["en_title"], :name => "index_films_on_en_title"
  add_index "films", ["is_favourite"], :name => "is_favourite"
  add_index "films", ["item_id"], :name => "item_id"
  add_index "films", ["last_download_time"], :name => "last_download_time"
  add_index "films", ["month"], :name => "month"
  add_index "films", ["permalink"], :name => "index_films_on_permalink"
  add_index "films", ["quality_id"], :name => "quality_id"
  add_index "films", ["ru_title"], :name => "index_films_on_ru_title"
  add_index "films", ["time"], :name => "time"
  add_index "films", ["title"], :name => "title"
  add_index "films", ["torrent"], :name => "index_films_on_torrent"
  add_index "films", ["translation_id"], :name => "translation_id"
  add_index "films", ["user_id"], :name => "user_id"
  add_index "films", ["visible"], :name => "index_films_on_without_files"
  add_index "films", ["year"], :name => "year"
  add_index "films", ["youtube_link"], :name => "index_films_on_youtube_link"

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

  create_table "films_collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "youtube_link"
    t.string   "cover"
    t.string   "description"
  end

  add_index "films_collections", ["cover"], :name => "index_films_collections_on_cover"
  add_index "films_collections", ["description"], :name => "index_films_collections_on_description"
  add_index "films_collections", ["name"], :name => "index_films_collections_on_name"
  add_index "films_collections", ["youtube_link"], :name => "index_films_collections_on_youtube_link"

  create_table "films_directors", :force => true do |t|
    t.string "name", :limit => 100
  end

  create_table "films_directors_through", :id => false, :force => true do |t|
    t.integer  "film_id"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "films_directors_through", ["film_id", "director_id"], :name => "index_films_directors_through_on_film_id_and_director_id", :unique => true

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
    t.integer  "quality_id"
  end

  add_index "films_files", ["ext"], :name => "ext"
  add_index "films_files", ["film_id"], :name => "index_films_files_on_film_id"
  add_index "films_files", ["format_id"], :name => "format_id"
  add_index "films_files", ["position"], :name => "position"
  add_index "films_files", ["quality_id"], :name => "index_films_files_on_quality_id"
  add_index "films_files", ["size"], :name => "size"

  create_table "films_formats", :force => true do |t|
    t.string   "title",       :limit => 100
    t.string   "description", :limit => 100
    t.string   "ffparams",    :limit => 1000
    t.string   "ext",         :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_genres", :force => true do |t|
    t.string   "title",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_genres_through", :id => false, :force => true do |t|
    t.integer  "genreable_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genreable_type"
  end

  add_index "films_genres_through", ["genreable_id", "genre_id"], :name => "index_films_genres_through_on_film_id_and_genre_id", :unique => true
  add_index "films_genres_through", ["genreable_type"], :name => "index_films_genres_through_on_genreable_type"

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

  add_index "films_parts", ["downloads"], :name => "index_films_parts_on_downloads"
  add_index "films_parts", ["file_id"], :name => "file_id"
  add_index "films_parts", ["film_id"], :name => "index_films_parts_on_film_id"
  add_index "films_parts", ["format_id"], :name => "index_films_parts_on_format_id"
  add_index "films_parts", ["num"], :name => "num"

  create_table "films_qualities", :force => true do |t|
    t.string   "title",      :limit => 50
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_trailers", :force => true do |t|
    t.integer  "film_id",                  :null => false
    t.string   "filename",   :limit => 50
    t.integer  "filesize"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films_translations", :force => true do |t|
    t.string   "title",      :limit => 50
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mp3_albums", :force => true do |t|
    t.integer  "artist_id",                         :default => 0
    t.string   "name",               :limit => 256
    t.string   "year",               :limit => 4,   :default => "0000"
    t.integer  "count_tracks",                      :default => 0
    t.text     "album_comment_up"
    t.text     "album_comment_down"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mp3_albums", ["artist_id"], :name => "album_artist_id"

  create_table "mp3_alphabet", :force => true do |t|
    t.integer "isset_rus",      :default => 0
    t.integer "isset_eng",      :default => 0
    t.integer "count_hits_rus", :default => 0
    t.integer "count_hits_eng", :default => 0
  end

  add_index "mp3_alphabet", ["isset_eng"], :name => "alph_isset_eng"
  add_index "mp3_alphabet", ["isset_rus"], :name => "alph_isset_rus"

  create_table "mp3_artists", :force => true do |t|
    t.string   "name",                :limit => 256
    t.string   "first_letter",        :limit => 1
    t.string   "lang",                :limit => 3
    t.integer  "count_albums",                       :default => 0
    t.integer  "count_tracks",                       :default => 0
    t.integer  "count_hits",          :limit => 1,   :default => 0
    t.text     "artist_comment_up"
    t.text     "artist_comment_down"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "mp3_artists", ["first_letter"], :name => "artist_first_letter"
  add_index "mp3_artists", ["lang"], :name => "artist_lang"
  add_index "mp3_artists", ["permalink"], :name => "index_mp3_artists_on_permalink"

  create_table "mp3_bitrate", :id => false, :force => true do |t|
    t.integer "file_id"
    t.integer "file_bitrate"
    t.string  "file_size",    :limit => 16
    t.string  "file"
  end

  add_index "mp3_bitrate", ["file_id"], :name => "bitrate_file_id"

  create_table "mp3_category", :primary_key => "category_id", :force => true do |t|
    t.integer "category_parent_id",                   :default => 0
    t.string  "category_name",         :limit => 256
    t.text    "category_comment_up"
    t.text    "category_comment_down"
  end

  add_index "mp3_category", ["category_parent_id"], :name => "category_parent_id"

  create_table "mp3_files", :force => true do |t|
    t.string   "ftp_path",          :limit => 256
    t.string   "path",              :limit => 256
    t.string   "name",              :limit => 256
    t.string   "fname",             :limit => 256
    t.string   "length",            :limit => 5,   :default => "00:00"
    t.integer  "genre_id"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.integer  "order"
    t.integer  "order_nomination",                 :default => 0
    t.boolean  "hit",                              :default => false
    t.datetime "file_hit_date"
    t.boolean  "new",                              :default => false
    t.integer  "download",                         :default => 0
    t.text     "file_comment_up"
    t.text     "file_comment_down"
    t.datetime "created_at"
    t.string   "new_path"
    t.integer  "length_sec"
    t.integer  "news_id"
    t.string   "permalink"
    t.datetime "updated_at",                                            :null => false
    t.datetime "published_at"
    t.string   "vk_url"
  end

  add_index "mp3_files", ["album_id"], :name => "file_album_id"
  add_index "mp3_files", ["artist_id"], :name => "file_artist_id"
  add_index "mp3_files", ["created_at"], :name => "created_at"
  add_index "mp3_files", ["download"], :name => "file_count_downloads"
  add_index "mp3_files", ["file_hit_date"], :name => "file_hit_date"
  add_index "mp3_files", ["ftp_path"], :name => "index_mp3_files_on_ftp_path"
  add_index "mp3_files", ["genre_id"], :name => "file_category_id"
  add_index "mp3_files", ["new_path"], :name => "index_mp3_files_on_new_path"
  add_index "mp3_files", ["order"], :name => "file_order"
  add_index "mp3_files", ["order_nomination"], :name => "file_order_nomination"
  add_index "mp3_files", ["permalink"], :name => "index_mp3_files_on_permalink"

  create_table "mp3_genres", :primary_key => "genre_id", :force => true do |t|
    t.string  "genre_name",         :limit => 256
    t.integer "genre_count_tracks"
    t.text    "genre_comment_up"
    t.text    "genre_comment_down"
  end

  create_table "mp3_nomination", :primary_key => "nomination_id", :force => true do |t|
    t.string "nomination_name",         :limit => 256
    t.text   "nomination_comment_up"
    t.text   "nomination_comment_down"
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

  create_table "music_collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "music_collections", ["name"], :name => "index_music_collections_on_name"

  create_table "news", :force => true do |t|
    t.string   "description",  :limit => 1000
    t.string   "section"
    t.boolean  "visible"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "title"
    t.datetime "published_at"
    t.integer  "user_id"
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

  create_table "public_pages", :force => true do |t|
    t.string   "vk_url"
    t.string   "category"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "public_pages", ["category"], :name => "index_public_pages_on_category"
  add_index "public_pages", ["title"], :name => "index_public_pages_on_title"
  add_index "public_pages", ["vk_url"], :name => "index_public_pages_on_vk_url"

  create_table "public_posts", :force => true do |t|
    t.string   "vk_id"
    t.boolean  "visible"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  add_index "public_posts", ["image"], :name => "index_public_posts_on_image"
  add_index "public_posts", ["visible"], :name => "index_public_posts_on_visible"
  add_index "public_posts", ["vk_id"], :name => "index_public_posts_on_vk_id"

  create_table "recomendation_lists", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "related_items", :force => true do |t|
    t.integer  "source_item_id"
    t.integer  "related_item_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "related_items", ["related_item_id"], :name => "index_related_items_on_related_item_id"
  add_index "related_items", ["source_item_id"], :name => "index_related_items_on_source_item_id"

  create_table "serial_seasons", :force => true do |t|
    t.integer  "serial_id"
    t.integer  "number"
    t.integer  "serial_serie_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "title"
  end

  add_index "serial_seasons", ["title"], :name => "index_serial_seasons_on_title"

  create_table "serial_serie_files", :force => true do |t|
    t.integer  "serie_id"
    t.integer  "quality_id"
    t.integer  "format_id"
    t.string   "attach"
    t.integer  "size",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "download",   :default => 0
  end

  add_index "serial_serie_files", ["attach"], :name => "index_serial_serie_files_on_attach"
  add_index "serial_serie_files", ["download"], :name => "index_serial_serie_files_on_downloads"
  add_index "serial_serie_files", ["format_id"], :name => "index_serial_serie_files_on_format_id"
  add_index "serial_serie_files", ["quality_id"], :name => "index_serial_serie_files_on_quality_id"
  add_index "serial_serie_files", ["serie_id"], :name => "index_serial_serie_files_on_serie_id"
  add_index "serial_serie_files", ["size"], :name => "index_serial_serie_files_on_size"

  create_table "serials", :force => true do |t|
    t.string   "description"
    t.integer  "season"
    t.boolean  "updating",     :default => true
    t.string   "title"
    t.string   "cover"
    t.boolean  "hit"
    t.string   "years"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.datetime "published_at"
    t.string   "permalink"
    t.boolean  "lang"
    t.string   "torrent"
  end

  add_index "serials", ["lang"], :name => "index_serials_on_lang"
  add_index "serials", ["permalink"], :name => "index_serials_on_permalink"

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
    t.boolean  "vk"
  end

  add_index "series", ["serial_id"], :name => "index_series_on_serial_id"

  create_table "subscribtions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subscribable_id"
    t.string   "subscribable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "video_files", :force => true do |t|
    t.integer  "video_id"
    t.integer  "quality_id"
    t.integer  "format_id"
    t.integer  "size"
    t.string   "attach"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "video_files", ["attach"], :name => "index_video_files_on_attach"
  add_index "video_files", ["format_id"], :name => "index_video_files_on_format_id"
  add_index "video_files", ["quality_id"], :name => "index_video_files_on_quality_id"
  add_index "video_files", ["size"], :name => "index_video_files_on_size"
  add_index "video_files", ["video_id"], :name => "index_video_files_on_video_id"

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
    t.string   "source_video"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "mp4_640"
    t.datetime "published_at"
  end

  add_index "videos", ["category_id"], :name => "index_videos_on_category_id"

  create_table "visits", :force => true do |t|
    t.integer  "visitable_id"
    t.string   "visitable_type"
    t.integer  "fromable_id"
    t.string   "fromable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "vk_posts", :force => true do |t|
    t.string   "vk_description"
    t.string   "vk_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "vk_posts", ["vk_description"], :name => "index_vk_posts_on_vk_description"
  add_index "vk_posts", ["vk_id"], :name => "index_vk_posts_on_vk_id"

  create_table "vk_publics", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wishes", :force => true do |t|
    t.integer  "wishable_id"
    t.string   "wishable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "youtube_searcher_video_throughs", :force => true do |t|
    t.integer  "video_id"
    t.integer  "searcher_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "youtube_searchers", :force => true do |t|
    t.string   "keywords"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "youtube_searchers", ["keywords"], :name => "index_youtube_searchers_on_keywords"

  create_table "youtube_videos", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "views"
    t.string   "cover"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "source_url"
    t.string   "time"
  end

  add_index "youtube_videos", ["cover"], :name => "index_youtube_videos_on_image"
  add_index "youtube_videos", ["description"], :name => "index_youtube_videos_on_description"
  add_index "youtube_videos", ["name"], :name => "index_youtube_videos_on_name"
  add_index "youtube_videos", ["source_url"], :name => "index_youtube_videos_on_source_url"
  add_index "youtube_videos", ["time"], :name => "index_youtube_videos_on_time"
  add_index "youtube_videos", ["views"], :name => "index_youtube_videos_on_views"

end
