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

ActiveRecord::Schema.define(version: 20170221053752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string   "airline_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.bigint   "city_id"
    t.bigint   "latitute"
    t.bigint   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "apis", force: :cascade do |t|
    t.string   "api_name"
    t.text     "api_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cache_destinations", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.bigint   "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.bigint   "latitude"
    t.bigint   "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "locale"
    t.string   "country"
    t.string   "currency"
  end

  create_table "flight_caches", force: :cascade do |t|
    t.bigint   "origin_id"
    t.string   "origin_id_type"
    t.bigint   "destination_id"
    t.string   "destination_type"
    t.bigint   "price_min"
    t.bigint   "airline_id"
    t.integer  "api_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "week"
    t.boolean  "round_trip"
  end

  create_table "popular_destinations", force: :cascade do |t|
    t.bigint   "starting_region_id"
    t.bigint   "destination_id"
    t.string   "destination_type"
    t.integer  "starting_week"
    t.integer  "ending_week"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "regions", force: :cascade do |t|
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
