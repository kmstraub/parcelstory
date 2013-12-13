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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131211013657) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "parcel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["parcel_id"], name: "index_books_on_parcel_id"
  add_index "books", ["user_id"], name: "index_books_on_user_id"

  create_table "events", force: true do |t|
    t.date     "when"
    t.text     "body"
    t.string   "source"
    t.integer  "parcel_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "libraries", force: true do |t|
    t.integer  "parcel_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parcels", force: true do |t|
    t.string   "address"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "county"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parcels", ["user_id"], name: "index_parcels_on_user_id"

  create_table "posts", force: true do |t|
    t.text     "body"
    t.integer  "user_id",            null: false
    t.integer  "parcel_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "posts", ["parcel_id"], name: "index_posts_on_parcel_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "stories", force: true do |t|
    t.text     "body"
    t.string   "story_type"
    t.string   "source"
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "parcel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "stories", ["book_id"], name: "index_stories_on_book_id"
  add_index "stories", ["parcel_id"], name: "index_stories_on_parcel_id"
  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "parcel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["parcel_id"], name: "index_subscriptions_on_parcel_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
