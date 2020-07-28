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

ActiveRecord::Schema.define(version: 2020_07_28_035739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_harbingers", force: :cascade do |t|
    t.bigint "harbinger_id"
    t.bigint "daily_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_message_id"], name: "index_daily_harbingers_on_daily_message_id"
    t.index ["harbinger_id"], name: "index_daily_harbingers_on_harbinger_id"
  end

  create_table "daily_messages", force: :cascade do |t|
    t.string "description"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "harbinger_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "harbinger_id"
    t.index ["harbinger_id"], name: "index_harbinger_users_on_harbinger_id"
    t.index ["user_id"], name: "index_harbinger_users_on_user_id"
  end

  create_table "harbingers", force: :cascade do |t|
    t.string "name"
    t.integer "neo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_messages", force: :cascade do |t|
    t.string "description"
    t.string "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "birthday"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "email"
  end

  add_foreign_key "daily_harbingers", "daily_messages"
  add_foreign_key "daily_harbingers", "harbingers"
  add_foreign_key "harbinger_users", "harbingers"
  add_foreign_key "harbinger_users", "users"
  add_foreign_key "personal_messages", "users"
end
