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

ActiveRecord::Schema.define(version: 20160320143239) do

  create_table "givings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wish_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "givings", ["user_id"], name: "index_givings_on_user_id"
  add_index "givings", ["wish_id"], name: "index_givings_on_wish_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "uid"
    t.string   "hashed_id"
    t.string   "name"
    t.string   "image"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["hashed_id"], name: "index_users_on_hashed_id", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

  create_table "wish_images", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "wish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wish_images", ["wish_id"], name: "index_wish_images_on_wish_id"

  create_table "wishes", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "comment"
    t.text     "description"
    t.string   "state"
    t.string   "price_max"
    t.string   "price_min"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "wishes", ["category_id"], name: "index_wishes_on_category_id"
  add_index "wishes", ["user_id"], name: "index_wishes_on_user_id"

end
