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

ActiveRecord::Schema.define(:version => 20140109091557) do

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

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_music", :id => false, :force => true do |t|
    t.integer "music_id"
    t.integer "category_id"
  end

  add_index "categories_music", ["music_id", "category_id"], :name => "index_categories_music_on_music_id_and_category_id"

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
    t.string   "description"
    t.string   "section"
    t.boolean  "visible"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

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
