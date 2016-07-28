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

ActiveRecord::Schema.define(version: 20160728130625) do

  create_table "snips", force: :cascade do |t|
    t.string   "snipOwner"
    t.string   "name"
    t.string   "language"
    t.string   "description"
    t.string   "summary"
    t.string   "readme"
    t.string   "licence"
    t.string   "volt"
    t.string   "voltOwner"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
  end

  add_index "snips", ["author_id"], name: "index_snips_on_author_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "volts", force: :cascade do |t|
    t.string   "name"
    t.integer  "members_id_id"
    t.string   "project_name"
    t.string   "default_licence"
    t.integer  "snips_id_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "author_id"
  end

  add_index "volts", ["author_id"], name: "index_volts_on_author_id"
  add_index "volts", ["members_id_id"], name: "index_volts_on_members_id_id"
  add_index "volts", ["snips_id_id"], name: "index_volts_on_snips_id_id"

end
