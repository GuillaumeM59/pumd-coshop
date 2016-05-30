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

ActiveRecord::Schema.define(version: 20160525130302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer  "shop_id"
    t.integer  "driver_id"
    t.datetime "go_at"
    t.datetime "come_back"
    t.integer  "pass1_id"
    t.integer  "pass2_id"
    t.integer  "pass3_id"
    t.integer  "pass4_id"
    t.boolean  "cangodrive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "home"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "brandpic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "carold"
    t.string   "carpic"
    t.string   "carbrand"
    t.string   "carmodel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "region"
    t.string   "departement"
    t.string   "zip"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "bid_id"
    t.integer  "driver_id"
    t.integer  "pass_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "prenom"
    t.string   "email"
    t.string   "objet"
    t.text     "contenu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.boolean  "isdrive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.string   "nom"
    t.string   "prenom"
    t.text     "comment"
    t.boolean  "subscribe",              default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "phone"
    t.string   "avatar"
    t.string   "adress"
    t.string   "zipcode"
    t.string   "city"
    t.string   "country"
    t.integer  "xp"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
