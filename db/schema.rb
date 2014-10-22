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

ActiveRecord::Schema.define(:version => 20141020075535) do

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
  add_index "admin_replies", ["content"], :name => "index_admin_replies_on_content", :length => {"content"=>255}
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
  end

  create_table "ads_links", :force => true do |t|
    t.string   "title"
    t.string   "to"
    t.string   "from"
    t.datetime "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.boolean  "hit",         :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "with_videos", :default => false
    t.boolean  "with_music",  :default => false
    t.string   "description"
    t.string   "image"
    t.string   "permalink"
    t.string   "vk_title"
  end

  add_index "collections", ["description"], :name => "index_collections_on_description"
  add_index "collections", ["image"], :name => "index_collections_on_image"
  add_index "collections", ["permalink"], :name => "index_collections_on_permalink"

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
    t.integer  "downloads",                            :default => 0
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
  end

  add_index "films", ["blocked"], :name => "index_films_on_blocked"
  add_index "films", ["count_comments"], :name => "count_comments"
  add_index "films", ["count_likes"], :name => "count_likes"
  add_index "films", ["cover"], :name => "index_films_on_cover"
  add_index "films", ["created_at"], :name => "news_time"
  add_index "films", ["downloads"], :name => "downloads"
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
    t.integer  "quality_id"
  end

  add_index "films_files", ["ext"], :name => "ext"
  add_index "films_files", ["film_id"], :name => "film_id"
  add_index "films_files", ["format_id"], :name => "format_id"
  add_index "films_files", ["position"], :name => "position"
  add_index "films_files", ["quality_id"], :name => "index_films_files_on_quality_id"
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
    t.integer  "genreable_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genreable_type"
    t.integer  "id"
  end

  add_index "films_genres_through", ["genreable_id", "genre_id"], :name => "film_id", :unique => true
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

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", :unique => true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

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
    t.integer "isset_rus",      :default => 0, :null => false
    t.integer "isset_eng",      :default => 0, :null => false
    t.integer "count_hits_rus", :default => 0, :null => false
    t.integer "count_hits_eng", :default => 0, :null => false
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
    t.integer "file_id",                    :null => false
    t.integer "file_bitrate",               :null => false
    t.string  "file_size",    :limit => 16, :null => false
    t.string  "file"
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
    t.integer  "downloads",                        :default => 0
    t.text     "file_comment_up"
    t.text     "file_comment_down"
    t.datetime "created_at",                                            :null => false
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
  add_index "mp3_files", ["downloads"], :name => "file_count_downloads"
  add_index "mp3_files", ["file_hit_date"], :name => "file_hit_date"
  add_index "mp3_files", ["ftp_path"], :name => "index_mp3_files_on_ftp_path", :length => {"ftp_path"=>255}
  add_index "mp3_files", ["genre_id"], :name => "file_category_id"
  add_index "mp3_files", ["new_path"], :name => "index_mp3_files_on_new_path"
  add_index "mp3_files", ["order"], :name => "file_order"
  add_index "mp3_files", ["order_nomination"], :name => "file_order_nomination"
  add_index "mp3_files", ["permalink"], :name => "index_mp3_files_on_permalink"

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
  end

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
    t.integer  "downloads",  :default => 0
  end

  add_index "serial_serie_files", ["attach"], :name => "index_serial_serie_files_on_attach"
  add_index "serial_serie_files", ["downloads"], :name => "index_serial_serie_files_on_downloads"
  add_index "serial_serie_files", ["format_id"], :name => "index_serial_serie_files_on_format_id"
  add_index "serial_serie_files", ["quality_id"], :name => "index_serial_serie_files_on_quality_id"
  add_index "serial_serie_files", ["serie_id"], :name => "index_serial_serie_files_on_serie_id"
  add_index "serial_serie_files", ["size"], :name => "index_serial_serie_files_on_size"

  create_table "serials", :force => true do |t|
    t.string   "description"
    t.integer  "season"
    t.boolean  "updating",     :default => true
    t.string   "name"
    t.string   "cover"
    t.boolean  "hit"
    t.string   "years"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.datetime "published_at"
    t.string   "permalink"
    t.boolean  "lang"
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
  end

  add_index "series", ["serial_id"], :name => "index_series_on_serial_id"

  create_table "spree_addresses", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_addresses", ["country_id"], :name => "index_spree_addresses_on_country_id"
  add_index "spree_addresses", ["firstname"], :name => "index_addresses_on_firstname"
  add_index "spree_addresses", ["lastname"], :name => "index_addresses_on_lastname"
  add_index "spree_addresses", ["state_id"], :name => "index_spree_addresses_on_state_id"

  create_table "spree_adjustments", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "adjustable_id"
    t.string   "adjustable_type"
    t.decimal  "amount",          :precision => 10, :scale => 2
    t.string   "label"
    t.boolean  "mandatory"
    t.boolean  "eligible",                                       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "order_id"
    t.boolean  "included",                                       :default => false
  end

  add_index "spree_adjustments", ["adjustable_id", "adjustable_type"], :name => "index_spree_adjustments_on_adjustable_id_and_adjustable_type"
  add_index "spree_adjustments", ["adjustable_id"], :name => "index_adjustments_on_order_id"
  add_index "spree_adjustments", ["eligible"], :name => "index_spree_adjustments_on_eligible"
  add_index "spree_adjustments", ["order_id"], :name => "index_spree_adjustments_on_order_id"
  add_index "spree_adjustments", ["source_id", "source_type"], :name => "index_spree_adjustments_on_source_id_and_source_type"

  create_table "spree_assets", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    :limit => 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_assets", ["viewable_id"], :name => "index_assets_on_viewable_id"
  add_index "spree_assets", ["viewable_type", "type"], :name => "index_assets_on_viewable_type_and_type"

  create_table "spree_calculators", :force => true do |t|
    t.string   "type"
    t.integer  "calculable_id"
    t.string   "calculable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
  end

  add_index "spree_calculators", ["calculable_id", "calculable_type"], :name => "index_spree_calculators_on_calculable_id_and_calculable_type"
  add_index "spree_calculators", ["id", "type"], :name => "index_spree_calculators_on_id_and_type"

  create_table "spree_configurations", :force => true do |t|
    t.string   "name"
    t.string   "type",       :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_configurations", ["name", "type"], :name => "index_spree_configurations_on_name_and_type"

  create_table "spree_countries", :force => true do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", :default => false
    t.datetime "updated_at"
  end

  create_table "spree_credit_cards", :force => true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.boolean  "default",                     :default => false, :null => false
  end

  add_index "spree_credit_cards", ["address_id"], :name => "index_spree_credit_cards_on_address_id"
  add_index "spree_credit_cards", ["payment_method_id"], :name => "index_spree_credit_cards_on_payment_method_id"
  add_index "spree_credit_cards", ["user_id"], :name => "index_spree_credit_cards_on_user_id"

  create_table "spree_customer_returns", :force => true do |t|
    t.string   "number"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_gateways", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.string   "server",      :default => "test"
    t.boolean  "test_mode",   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
  end

  add_index "spree_gateways", ["active"], :name => "index_spree_gateways_on_active"
  add_index "spree_gateways", ["test_mode"], :name => "index_spree_gateways_on_test_mode"

  create_table "spree_inventory_units", :force => true do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pending",      :default => true
    t.integer  "line_item_id"
  end

  add_index "spree_inventory_units", ["line_item_id"], :name => "index_spree_inventory_units_on_line_item_id"
  add_index "spree_inventory_units", ["order_id"], :name => "index_inventory_units_on_order_id"
  add_index "spree_inventory_units", ["shipment_id"], :name => "index_inventory_units_on_shipment_id"
  add_index "spree_inventory_units", ["variant_id"], :name => "index_inventory_units_on_variant_id"

  create_table "spree_line_items", :force => true do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                             :null => false
    t.decimal  "price",                :precision => 10, :scale => 2,                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.decimal  "cost_price",           :precision => 10, :scale => 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",     :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "additional_tax_total", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "promo_total",          :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "included_tax_total",   :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "pre_tax_amount",       :precision => 8,  :scale => 2, :default => 0.0
  end

  add_index "spree_line_items", ["order_id"], :name => "index_spree_line_items_on_order_id"
  add_index "spree_line_items", ["tax_category_id"], :name => "index_spree_line_items_on_tax_category_id"
  add_index "spree_line_items", ["variant_id"], :name => "index_spree_line_items_on_variant_id"

  create_table "spree_log_entries", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_log_entries", ["source_id", "source_type"], :name => "index_spree_log_entries_on_source_id_and_source_type"

  create_table "spree_option_type_translations", :force => true do |t|
    t.integer  "spree_option_type_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "presentation"
  end

  add_index "spree_option_type_translations", ["locale"], :name => "index_spree_option_type_translations_on_locale"
  add_index "spree_option_type_translations", ["spree_option_type_id"], :name => "index_spree_option_type_translations_on_spree_option_type_id"

  create_table "spree_option_types", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "presentation", :limit => 100
    t.integer  "position",                    :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_option_types", ["position"], :name => "index_spree_option_types_on_position"

  create_table "spree_option_types_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_value_translations", :force => true do |t|
    t.integer  "spree_option_value_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "presentation"
  end

  add_index "spree_option_value_translations", ["locale"], :name => "index_spree_option_value_translations_on_locale"
  add_index "spree_option_value_translations", ["spree_option_value_id"], :name => "index_spree_option_value_translations_on_spree_option_value_id"

  create_table "spree_option_values", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_option_values", ["option_type_id"], :name => "index_spree_option_values_on_option_type_id"
  add_index "spree_option_values", ["position"], :name => "index_spree_option_values_on_position"

  create_table "spree_option_values_variants", :id => false, :force => true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_values_variants", ["variant_id", "option_value_id"], :name => "index_option_values_variants_on_variant_id_and_option_value_id"
  add_index "spree_option_values_variants", ["variant_id"], :name => "index_spree_option_values_variants_on_variant_id"

  create_table "spree_orders", :force => true do |t|
    t.string   "number",                 :limit => 32
    t.decimal  "item_total",                           :precision => 10, :scale => 2, :default => 0.0,     :null => false
    t.decimal  "total",                                :precision => 10, :scale => 2, :default => 0.0,     :null => false
    t.string   "state"
    t.decimal  "adjustment_total",                     :precision => 10, :scale => 2, :default => 0.0,     :null => false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                        :precision => 10, :scale => 2, :default => 0.0
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                       :precision => 10, :scale => 2, :default => 0.0,     :null => false
    t.decimal  "additional_tax_total",                 :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "promo_total",                          :precision => 10, :scale => 2, :default => 0.0
    t.string   "channel",                                                             :default => "spree"
    t.decimal  "included_tax_total",                   :precision => 10, :scale => 2, :default => 0.0,     :null => false
    t.integer  "item_count",                                                          :default => 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                              :default => false
    t.boolean  "considered_risky",                                                    :default => false
    t.string   "guest_token"
    t.datetime "canceled_at"
    t.integer  "canceler_id"
    t.integer  "store_id"
  end

  add_index "spree_orders", ["approver_id"], :name => "index_spree_orders_on_approver_id"
  add_index "spree_orders", ["bill_address_id"], :name => "index_spree_orders_on_bill_address_id"
  add_index "spree_orders", ["completed_at"], :name => "index_spree_orders_on_completed_at"
  add_index "spree_orders", ["confirmation_delivered"], :name => "index_spree_orders_on_confirmation_delivered"
  add_index "spree_orders", ["considered_risky"], :name => "index_spree_orders_on_considered_risky"
  add_index "spree_orders", ["created_by_id"], :name => "index_spree_orders_on_created_by_id"
  add_index "spree_orders", ["number"], :name => "index_spree_orders_on_number"
  add_index "spree_orders", ["ship_address_id"], :name => "index_spree_orders_on_ship_address_id"
  add_index "spree_orders", ["shipping_method_id"], :name => "index_spree_orders_on_shipping_method_id"
  add_index "spree_orders", ["user_id", "created_by_id"], :name => "index_spree_orders_on_user_id_and_created_by_id"
  add_index "spree_orders", ["user_id"], :name => "index_spree_orders_on_user_id"

  create_table "spree_orders_promotions", :id => false, :force => true do |t|
    t.integer "order_id"
    t.integer "promotion_id"
  end

  add_index "spree_orders_promotions", ["order_id", "promotion_id"], :name => "index_spree_orders_promotions_on_order_id_and_promotion_id"

  create_table "spree_payment_capture_events", :force => true do |t|
    t.decimal  "amount",     :precision => 10, :scale => 2, :default => 0.0
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_payment_capture_events", ["payment_id"], :name => "index_spree_payment_capture_events_on_payment_id"

  create_table "spree_payment_methods", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",       :default => true
    t.string   "environment",  :default => "development"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_on"
    t.boolean  "auto_capture"
    t.text     "preferences"
  end

  add_index "spree_payment_methods", ["id", "type"], :name => "index_spree_payment_methods_on_id_and_type"

  create_table "spree_payments", :force => true do |t|
    t.decimal  "amount",               :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "order_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
  end

  add_index "spree_payments", ["order_id"], :name => "index_spree_payments_on_order_id"
  add_index "spree_payments", ["payment_method_id"], :name => "index_spree_payments_on_payment_method_id"
  add_index "spree_payments", ["source_id", "source_type"], :name => "index_spree_payments_on_source_id_and_source_type"

  create_table "spree_preferences", :force => true do |t|
    t.text     "value"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_preferences", ["key"], :name => "index_spree_preferences_on_key", :unique => true

  create_table "spree_prices", :force => true do |t|
    t.integer  "variant_id",                                :null => false
    t.decimal  "amount",     :precision => 10, :scale => 2
    t.string   "currency"
    t.datetime "deleted_at"
  end

  add_index "spree_prices", ["deleted_at"], :name => "index_spree_prices_on_deleted_at"
  add_index "spree_prices", ["variant_id", "currency"], :name => "index_spree_prices_on_variant_id_and_currency"

  create_table "spree_product_option_types", :force => true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_product_option_types", ["option_type_id"], :name => "index_spree_product_option_types_on_option_type_id"
  add_index "spree_product_option_types", ["position"], :name => "index_spree_product_option_types_on_position"
  add_index "spree_product_option_types", ["product_id"], :name => "index_spree_product_option_types_on_product_id"

  create_table "spree_product_properties", :force => true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    :default => 0
  end

  add_index "spree_product_properties", ["position"], :name => "index_spree_product_properties_on_position"
  add_index "spree_product_properties", ["product_id"], :name => "index_product_properties_on_product_id"
  add_index "spree_product_properties", ["property_id"], :name => "index_spree_product_properties_on_property_id"

  create_table "spree_product_translations", :force => true do |t|
    t.integer  "spree_product_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "slug"
  end

  add_index "spree_product_translations", ["locale"], :name => "index_spree_product_translations_on_locale"
  add_index "spree_product_translations", ["spree_product_id"], :name => "index_spree_product_translations_on_spree_product_id"

  create_table "spree_products", :force => true do |t|
    t.string   "name",                 :default => "",   :null => false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promotionable",        :default => true
    t.string   "meta_title"
    t.string   "price_6pm"
  end

  add_index "spree_products", ["available_on"], :name => "index_spree_products_on_available_on"
  add_index "spree_products", ["deleted_at"], :name => "index_spree_products_on_deleted_at"
  add_index "spree_products", ["name"], :name => "index_spree_products_on_name"
  add_index "spree_products", ["shipping_category_id"], :name => "index_spree_products_on_shipping_category_id"
  add_index "spree_products", ["slug"], :name => "index_spree_products_on_slug"
  add_index "spree_products", ["slug"], :name => "permalink_idx_unique", :unique => true
  add_index "spree_products", ["tax_category_id"], :name => "index_spree_products_on_tax_category_id"

  create_table "spree_products_promotion_rules", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_products_promotion_rules", ["product_id"], :name => "index_products_promotion_rules_on_product_id"
  add_index "spree_products_promotion_rules", ["promotion_rule_id"], :name => "index_products_promotion_rules_on_promotion_rule_id"

  create_table "spree_products_taxons", :force => true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
  end

  add_index "spree_products_taxons", ["position"], :name => "index_spree_products_taxons_on_position"
  add_index "spree_products_taxons", ["product_id"], :name => "index_spree_products_taxons_on_product_id"
  add_index "spree_products_taxons", ["taxon_id"], :name => "index_spree_products_taxons_on_taxon_id"

  create_table "spree_promotion_action_line_items", :force => true do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            :default => 1
  end

  add_index "spree_promotion_action_line_items", ["promotion_action_id"], :name => "index_spree_promotion_action_line_items_on_promotion_action_id"
  add_index "spree_promotion_action_line_items", ["variant_id"], :name => "index_spree_promotion_action_line_items_on_variant_id"

  create_table "spree_promotion_actions", :force => true do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "deleted_at"
  end

  add_index "spree_promotion_actions", ["deleted_at"], :name => "index_spree_promotion_actions_on_deleted_at"
  add_index "spree_promotion_actions", ["id", "type"], :name => "index_spree_promotion_actions_on_id_and_type"
  add_index "spree_promotion_actions", ["promotion_id"], :name => "index_spree_promotion_actions_on_promotion_id"

  create_table "spree_promotion_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_promotion_rules", :force => true do |t|
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.text     "preferences"
  end

  add_index "spree_promotion_rules", ["product_group_id"], :name => "index_promotion_rules_on_product_group_id"
  add_index "spree_promotion_rules", ["promotion_id"], :name => "index_spree_promotion_rules_on_promotion_id"
  add_index "spree_promotion_rules", ["user_id"], :name => "index_promotion_rules_on_user_id"

  create_table "spree_promotion_rules_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rules_users", ["promotion_rule_id"], :name => "index_promotion_rules_users_on_promotion_rule_id"
  add_index "spree_promotion_rules_users", ["user_id"], :name => "index_promotion_rules_users_on_user_id"

  create_table "spree_promotion_translations", :force => true do |t|
    t.integer  "spree_promotion_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description"
  end

  add_index "spree_promotion_translations", ["locale"], :name => "index_spree_promotion_translations_on_locale"
  add_index "spree_promotion_translations", ["spree_promotion_id"], :name => "index_spree_promotion_translations_on_spree_promotion_id"

  create_table "spree_promotions", :force => true do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy",          :default => "all"
    t.string   "code"
    t.boolean  "advertise",             :default => false
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_category_id"
  end

  add_index "spree_promotions", ["advertise"], :name => "index_spree_promotions_on_advertise"
  add_index "spree_promotions", ["code"], :name => "index_spree_promotions_on_code"
  add_index "spree_promotions", ["expires_at"], :name => "index_spree_promotions_on_expires_at"
  add_index "spree_promotions", ["id", "type"], :name => "index_spree_promotions_on_id_and_type"
  add_index "spree_promotions", ["promotion_category_id"], :name => "index_spree_promotions_on_promotion_category_id"
  add_index "spree_promotions", ["starts_at"], :name => "index_spree_promotions_on_starts_at"

  create_table "spree_properties", :force => true do |t|
    t.string   "name"
    t.string   "presentation", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_properties_prototypes", :id => false, :force => true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "spree_property_translations", :force => true do |t|
    t.integer  "spree_property_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "presentation"
  end

  add_index "spree_property_translations", ["locale"], :name => "index_spree_property_translations_on_locale"
  add_index "spree_property_translations", ["spree_property_id"], :name => "index_spree_property_translations_on_spree_property_id"

  create_table "spree_prototypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refund_reasons", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.boolean  "mutable",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refunds", :force => true do |t|
    t.integer  "payment_id"
    t.decimal  "amount",           :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "refund_reason_id"
    t.integer  "reimbursement_id"
  end

  add_index "spree_refunds", ["refund_reason_id"], :name => "index_refunds_on_refund_reason_id"

  create_table "spree_reimbursement_credits", :force => true do |t|
    t.decimal "amount",           :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer "reimbursement_id"
    t.integer "creditable_id"
    t.string  "creditable_type"
  end

  create_table "spree_reimbursement_types", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.boolean  "mutable",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "spree_reimbursement_types", ["type"], :name => "index_spree_reimbursement_types_on_type"

  create_table "spree_reimbursements", :force => true do |t|
    t.string   "number"
    t.string   "reimbursement_status"
    t.integer  "customer_return_id"
    t.integer  "order_id"
    t.decimal  "total",                :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_reimbursements", ["customer_return_id"], :name => "index_spree_reimbursements_on_customer_return_id"
  add_index "spree_reimbursements", ["order_id"], :name => "index_spree_reimbursements_on_order_id"

  create_table "spree_return_authorization_reasons", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.boolean  "mutable",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_return_authorizations", :force => true do |t|
    t.string   "number"
    t.string   "state"
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_authorization_reason_id"
  end

  add_index "spree_return_authorizations", ["return_authorization_reason_id"], :name => "index_return_authorizations_on_return_authorization_reason_id"

  create_table "spree_return_items", :force => true do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pre_tax_amount",                  :precision => 12, :scale => 4, :default => 0.0, :null => false
    t.decimal  "included_tax_total",              :precision => 12, :scale => 4, :default => 0.0, :null => false
    t.decimal  "additional_tax_total",            :precision => 12, :scale => 4, :default => 0.0, :null => false
    t.string   "reception_status"
    t.string   "acceptance_status"
    t.integer  "customer_return_id"
    t.integer  "reimbursement_id"
    t.integer  "exchange_inventory_unit_id"
    t.text     "acceptance_status_errors"
    t.integer  "preferred_reimbursement_type_id"
    t.integer  "override_reimbursement_type_id"
  end

  add_index "spree_return_items", ["customer_return_id"], :name => "index_return_items_on_customer_return_id"
  add_index "spree_return_items", ["exchange_inventory_unit_id"], :name => "index_spree_return_items_on_exchange_inventory_unit_id"

  create_table "spree_roles", :force => true do |t|
    t.string "name"
  end

  create_table "spree_roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_roles_users", ["role_id"], :name => "index_spree_roles_users_on_role_id"
  add_index "spree_roles_users", ["user_id"], :name => "index_spree_roles_users_on_user_id"

  create_table "spree_shipments", :force => true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",                 :precision => 10, :scale => 2, :default => 0.0
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",     :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "additional_tax_total", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "promo_total",          :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "included_tax_total",   :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "pre_tax_amount",       :precision => 8,  :scale => 2, :default => 0.0
  end

  add_index "spree_shipments", ["address_id"], :name => "index_spree_shipments_on_address_id"
  add_index "spree_shipments", ["number"], :name => "index_shipments_on_number"
  add_index "spree_shipments", ["order_id"], :name => "index_spree_shipments_on_order_id"
  add_index "spree_shipments", ["stock_location_id"], :name => "index_spree_shipments_on_stock_location_id"

  create_table "spree_shipping_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_shipping_method_categories", :force => true do |t|
    t.integer  "shipping_method_id",   :null => false
    t.integer  "shipping_category_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_shipping_method_categories", ["shipping_category_id", "shipping_method_id"], :name => "unique_spree_shipping_method_categories", :unique => true
  add_index "spree_shipping_method_categories", ["shipping_method_id"], :name => "index_spree_shipping_method_categories_on_shipping_method_id"

  create_table "spree_shipping_methods", :force => true do |t|
    t.string   "name"
    t.string   "display_on"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "tax_category_id"
    t.string   "code"
  end

  add_index "spree_shipping_methods", ["deleted_at"], :name => "index_spree_shipping_methods_on_deleted_at"
  add_index "spree_shipping_methods", ["tax_category_id"], :name => "index_spree_shipping_methods_on_tax_category_id"

  create_table "spree_shipping_methods_zones", :id => false, :force => true do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_rates", :force => true do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                         :default => false
    t.decimal  "cost",               :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_rate_id"
  end

  add_index "spree_shipping_rates", ["selected"], :name => "index_spree_shipping_rates_on_selected"
  add_index "spree_shipping_rates", ["shipment_id", "shipping_method_id"], :name => "spree_shipping_rates_join_index", :unique => true
  add_index "spree_shipping_rates", ["tax_rate_id"], :name => "index_spree_shipping_rates_on_tax_rate_id"

  create_table "spree_skrill_transactions", :force => true do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_state_changes", :force => true do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_state_changes", ["stateful_id", "stateful_type"], :name => "index_spree_state_changes_on_stateful_id_and_stateful_type"
  add_index "spree_state_changes", ["user_id"], :name => "index_spree_state_changes_on_user_id"

  create_table "spree_states", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
  end

  add_index "spree_states", ["country_id"], :name => "index_spree_states_on_country_id"

  create_table "spree_stock_items", :force => true do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "backorderable",     :default => false
    t.datetime "deleted_at"
  end

  add_index "spree_stock_items", ["backorderable"], :name => "index_spree_stock_items_on_backorderable"
  add_index "spree_stock_items", ["deleted_at"], :name => "index_spree_stock_items_on_deleted_at"
  add_index "spree_stock_items", ["stock_location_id", "variant_id"], :name => "stock_item_by_loc_and_var_id"
  add_index "spree_stock_items", ["stock_location_id"], :name => "index_spree_stock_items_on_stock_location_id"

  create_table "spree_stock_locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                 :default => true
    t.boolean  "backorderable_default",  :default => false
    t.boolean  "propagate_all_variants", :default => true
    t.string   "admin_name"
    t.boolean  "default",                :default => false, :null => false
  end

  add_index "spree_stock_locations", ["active"], :name => "index_spree_stock_locations_on_active"
  add_index "spree_stock_locations", ["backorderable_default"], :name => "index_spree_stock_locations_on_backorderable_default"
  add_index "spree_stock_locations", ["country_id"], :name => "index_spree_stock_locations_on_country_id"
  add_index "spree_stock_locations", ["propagate_all_variants"], :name => "index_spree_stock_locations_on_propagate_all_variants"
  add_index "spree_stock_locations", ["state_id"], :name => "index_spree_stock_locations_on_state_id"

  create_table "spree_stock_movements", :force => true do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        :default => 0
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "originator_id"
    t.string   "originator_type"
  end

  add_index "spree_stock_movements", ["stock_item_id"], :name => "index_spree_stock_movements_on_stock_item_id"

  create_table "spree_stock_transfers", :force => true do |t|
    t.string   "type"
    t.string   "reference"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
  end

  add_index "spree_stock_transfers", ["destination_location_id"], :name => "index_spree_stock_transfers_on_destination_location_id"
  add_index "spree_stock_transfers", ["number"], :name => "index_spree_stock_transfers_on_number"
  add_index "spree_stock_transfers", ["source_location_id"], :name => "index_spree_stock_transfers_on_source_location_id"

  create_table "spree_stores", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title"
    t.string   "mail_from_address"
    t.string   "default_currency"
    t.string   "code"
    t.boolean  "default",           :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_stores", ["code"], :name => "index_spree_stores_on_code"
  add_index "spree_stores", ["default"], :name => "index_spree_stores_on_default"
  add_index "spree_stores", ["url"], :name => "index_spree_stores_on_url"

  create_table "spree_tax_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  :default => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_code"
  end

  add_index "spree_tax_categories", ["deleted_at"], :name => "index_spree_tax_categories_on_deleted_at"
  add_index "spree_tax_categories", ["is_default"], :name => "index_spree_tax_categories_on_is_default"

  create_table "spree_tax_rates", :force => true do |t|
    t.decimal  "amount",             :precision => 8, :scale => 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "show_rate_in_label",                               :default => true
    t.datetime "deleted_at"
  end

  add_index "spree_tax_rates", ["deleted_at"], :name => "index_spree_tax_rates_on_deleted_at"
  add_index "spree_tax_rates", ["included_in_price"], :name => "index_spree_tax_rates_on_included_in_price"
  add_index "spree_tax_rates", ["show_rate_in_label"], :name => "index_spree_tax_rates_on_show_rate_in_label"
  add_index "spree_tax_rates", ["tax_category_id"], :name => "index_spree_tax_rates_on_tax_category_id"
  add_index "spree_tax_rates", ["zone_id"], :name => "index_spree_tax_rates_on_zone_id"

  create_table "spree_taxon_translations", :force => true do |t|
    t.integer  "spree_taxon_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "permalink"
  end

  add_index "spree_taxon_translations", ["locale"], :name => "index_spree_taxon_translations_on_locale"
  add_index "spree_taxon_translations", ["spree_taxon_id"], :name => "index_spree_taxon_translations_on_spree_taxon_id"

  create_table "spree_taxonomies", :force => true do |t|
    t.string   "name",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   :default => 0
  end

  add_index "spree_taxonomies", ["position"], :name => "index_spree_taxonomies_on_position"

  create_table "spree_taxonomy_translations", :force => true do |t|
    t.integer  "spree_taxonomy_id"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "spree_taxonomy_translations", ["locale"], :name => "index_spree_taxonomy_translations_on_locale"
  add_index "spree_taxonomy_translations", ["spree_taxonomy_id"], :name => "index_spree_taxonomy_translations_on_spree_taxonomy_id"

  create_table "spree_taxons", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position",          :default => 0
    t.string   "name",                             :null => false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
  end

  add_index "spree_taxons", ["parent_id"], :name => "index_taxons_on_parent_id"
  add_index "spree_taxons", ["permalink"], :name => "index_taxons_on_permalink"
  add_index "spree_taxons", ["position"], :name => "index_spree_taxons_on_position"
  add_index "spree_taxons", ["taxonomy_id"], :name => "index_taxons_on_taxonomy_id"

  create_table "spree_taxons_promotion_rules", :force => true do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_taxons_promotion_rules", ["promotion_rule_id"], :name => "index_spree_taxons_promotion_rules_on_promotion_rule_id"
  add_index "spree_taxons_promotion_rules", ["taxon_id"], :name => "index_spree_taxons_promotion_rules_on_taxon_id"

  create_table "spree_tokenized_permissions", :force => true do |t|
    t.integer  "permissable_id"
    t.string   "permissable_type"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_tokenized_permissions", ["permissable_id", "permissable_type"], :name => "index_tokenized_name_and_type"

  create_table "spree_trackers", :force => true do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_trackers", ["active"], :name => "index_spree_trackers_on_active"

  create_table "spree_users", :force => true do |t|
    t.string   "encrypted_password",     :limit => 128
    t.string   "password_salt",          :limit => 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                         :default => 0, :null => false
    t.integer  "failed_attempts",                       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spree_api_key",          :limit => 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
  end

  add_index "spree_users", ["deleted_at"], :name => "index_spree_users_on_deleted_at"
  add_index "spree_users", ["email"], :name => "email_idx_unique", :unique => true
  add_index "spree_users", ["spree_api_key"], :name => "index_spree_users_on_spree_api_key"

  create_table "spree_variants", :force => true do |t|
    t.string   "sku",                                            :default => "",    :null => false
    t.decimal  "weight",          :precision => 8,  :scale => 2, :default => 0.0
    t.decimal  "height",          :precision => 8,  :scale => 2
    t.decimal  "width",           :precision => 8,  :scale => 2
    t.decimal  "depth",           :precision => 8,  :scale => 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                      :default => false
    t.integer  "product_id"
    t.decimal  "cost_price",      :precision => 10, :scale => 2
    t.string   "cost_currency"
    t.integer  "position"
    t.boolean  "track_inventory",                                :default => true
    t.integer  "tax_category_id"
    t.datetime "updated_at"
  end

  add_index "spree_variants", ["deleted_at"], :name => "index_spree_variants_on_deleted_at"
  add_index "spree_variants", ["is_master"], :name => "index_spree_variants_on_is_master"
  add_index "spree_variants", ["position"], :name => "index_spree_variants_on_position"
  add_index "spree_variants", ["product_id"], :name => "index_spree_variants_on_product_id"
  add_index "spree_variants", ["sku"], :name => "index_spree_variants_on_sku"
  add_index "spree_variants", ["tax_category_id"], :name => "index_spree_variants_on_tax_category_id"
  add_index "spree_variants", ["track_inventory"], :name => "index_spree_variants_on_track_inventory"

  create_table "spree_zone_members", :force => true do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_zone_members", ["zone_id"], :name => "index_spree_zone_members_on_zone_id"
  add_index "spree_zone_members", ["zoneable_id", "zoneable_type"], :name => "index_spree_zone_members_on_zoneable_id_and_zoneable_type"

  create_table "spree_zones", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        :default => false
    t.integer  "zone_members_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_zones", ["default_tax"], :name => "index_spree_zones_on_default_tax"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

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

  create_table "wishes", :force => true do |t|
    t.integer  "wishable_id"
    t.string   "wishable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
