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

ActiveRecord::Schema.define(version: 20170326201848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "address"
    t.integer  "sqft"
    t.integer  "baths"
    t.integer  "rent"
    t.integer  "bedrooms"
    t.string   "link"
    t.string   "pic"
    t.string   "neighborhood"
  end

  create_table "neighborhood_choices", force: :cascade do |t|
    t.integer  "neighborhood_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "age"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "min_roommates"
    t.integer  "max_roommates"
    t.boolean  "has_pets"
    t.boolean  "pets"
    t.string   "gender"
    t.string   "gender_pref"
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.string   "linkedin"
    t.string   "phone"
  end

end
