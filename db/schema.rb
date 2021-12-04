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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_01_100205) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "party_board_id"
    t.integer "video_id"
    t.integer "clip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clip_id"], name: "index_bookmarks_on_clip_id"
    t.index ["party_board_id"], name: "index_bookmarks_on_party_board_id"
    t.index ["user_id", "clip_id"], name: "index_bookmarks_on_user_id_and_clip_id", unique: true
    t.index ["user_id", "party_board_id"], name: "index_bookmarks_on_user_id_and_party_board_id", unique: true
    t.index ["user_id", "video_id"], name: "index_bookmarks_on_user_id_and_video_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
    t.index ["video_id"], name: "index_bookmarks_on_video_id"
  end

  create_table "clips", force: :cascade do |t|
    t.string "title", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "movie"
    t.index ["user_id"], name: "index_clips_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id"
    t.integer "party_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_board_id"], name: "index_comments_on_party_board_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "video_id"], name: "index_favorites_on_user_id_and_video_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["video_id"], name: "index_favorites_on_video_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "clip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clip_id"], name: "index_likes_on_clip_id"
    t.index ["user_id", "clip_id"], name: "index_likes_on_user_id_and_clip_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "party_boards", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recruit"
    t.index ["user_id"], name: "index_party_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "user_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "genre"
    t.string "geme"
    t.string "gameid"
    t.string "pcid"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "best_movie"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

end
