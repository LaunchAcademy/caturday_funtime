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

ActiveRecord::Schema.define(version: 20141002172438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "categories", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["tag"], name: "index_categories_on_tag", using: :btree

  create_table "categorizations", force: true do |t|
    t.integer "category_id", null: false
    t.integer "cat_id",      null: false
  end

  add_index "categorizations", ["category_id", "cat_id"], name: "index_categorizations_on_category_id_and_cat_id", unique: true, using: :btree

  create_table "cats", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "url",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     null: false
    t.string   "cat_photo"
  end

  add_index "cats", ["url"], name: "index_cats_on_url", using: :btree

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "reviews", force: true do |t|
    t.text     "review",     null: false
    t.integer  "cat_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    null: false
  end

  add_index "reviews", ["cat_id"], name: "index_reviews_on_cat_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role",                   default: "member", null: false
    t.string   "name",                                      null: false
    t.string   "profile_photo"
    t.boolean  "review_email",           default: true
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "value",         null: false
    t.integer  "voteable_id",   null: false
    t.string   "voteable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["voteable_type", "voteable_id", "user_id"], name: "index_votes_on_voteable_type_and_voteable_id_and_user_id", unique: true, using: :btree

end
