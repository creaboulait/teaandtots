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

ActiveRecord::Schema.define(version: 2018_08_10_063741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forecasts", force: :cascade do |t|
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_kids_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "kid_id"
    t.bigint "playdate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id"], name: "index_participations_on_kid_id"
    t.index ["playdate_id"], name: "index_participations_on_playdate_id"
  end

  create_table "playdates", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.string "address"
    t.datetime "datetime"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playdates_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "stars"
    t.bigint "playdate_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "reported", default: false
    t.integer "reported_by_user_id"
    t.index ["playdate_id"], name: "index_reviews_on_playdate_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "profilepic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.text "bio"
  end

end
