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

ActiveRecord::Schema.define(version: 20170603155657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "activities", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",             null: false
    t.uuid     "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
    t.text     "track_data"
    t.text     "track_image_data"
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "badges", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.text     "image_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_sashes", force: :cascade do |t|
    t.uuid     "badge_id"
    t.uuid     "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree
  end

  create_table "sashes", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "nickname"
    t.jsonb    "meta"
    t.integer  "status",          default: 0,     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "facebook_sub"
    t.string   "picture"
    t.string   "password_digest"
    t.string   "google_sub"
    t.integer  "role",            default: 0,     null: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.string   "name",                            null: false
    t.integer  "level",           default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["facebook_sub"], name: "index_users_on_facebook_sub", unique: true, using: :btree
    t.index ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  end

  add_foreign_key "activities", "users"
end
