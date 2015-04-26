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

ActiveRecord::Schema.define(version: 20150426145934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "word_count"
    t.boolean  "published"
    t.integer  "prompt_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.text     "content",                           null: false
    t.boolean  "prompt_of_the_day", default: false
    t.boolean  "on_deck",           default: false
    t.boolean  "used",              default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "reminder_copies", force: :cascade do |t|
    t.integer  "week",       null: false
    t.integer  "day",        null: false
    t.string   "subject",    null: false
    t.text     "copy",       null: false
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "username"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "longest_streak",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "unsubscribe",     default: false
  end

end
