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

ActiveRecord::Schema.define(version: 20190909163640) do

  create_table "event_people", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "amount",     limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_people", ["event_id"], name: "fk_rails_c2cdc05600", using: :btree

  create_table "event_things", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "amount",     limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_things", ["event_id"], name: "fk_rails_d811fd4cdb", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "category",        limit: 255
    t.string   "welcome_message", limit: 255
    t.string   "image",           limit: 255
    t.string   "file",            limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "amount",     limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "signup_id",  limit: 4
  end

  add_index "items", ["event_id"], name: "fk_rails_7c292ae2fe", using: :btree

  create_table "persons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "amount",     limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "persons", ["event_id"], name: "fk_rails_057495e8a9", using: :btree

  create_table "signup_items", force: :cascade do |t|
    t.string   "owner_type",        limit: 255,   default: "people", null: false
    t.integer  "owner_id",          limit: 4,                        null: false
    t.text     "title",             limit: 65535,                    null: false
    t.integer  "item_type",         limit: 4
    t.integer  "quantity",          limit: 4
    t.integer  "achieved_quantity", limit: 4,     default: 0,        null: false
    t.datetime "due_date"
    t.string   "due_time",          limit: 255
    t.text     "description",       limit: 65535
    t.integer  "sort_order",        limit: 4,     default: 0,        null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "signup_id",         limit: 4
  end

  create_table "signups", force: :cascade do |t|
    t.string   "title",                  limit: 255,                   null: false
    t.integer  "schoolclass_id",         limit: 4
    t.text     "description",            limit: 65535
    t.text     "description_html",       limit: 65535
    t.string   "signup_type",            limit: 255
    t.string   "image",                  limit: 255
    t.boolean  "is_all_day",                           default: false, null: false
    t.datetime "start_date"
    t.string   "start_time",             limit: 255
    t.datetime "end_date"
    t.string   "end_time",               limit: 255
    t.boolean  "all_rsvp_required",                    default: true,  null: false
    t.boolean  "is_open_signup",                       default: true,  null: false
    t.boolean  "is_published",                         default: false, null: false
    t.datetime "published_at"
    t.boolean  "has_invite_sent",                      default: false, null: false
    t.boolean  "send_reminders",                       default: true,  null: false
    t.integer  "signedup_reminder_days", limit: 4,     default: -1,    null: false
    t.boolean  "notify_on_signup",                     default: true,  null: false
    t.boolean  "has_event",                            default: false, null: false
    t.integer  "event_id",               limit: 4
    t.integer  "user_id",                limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "things", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "amount",     limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "event_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "things", ["event_id"], name: "fk_rails_8c4c1f9fb8", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "event_people", "events"
  add_foreign_key "event_things", "events"
  add_foreign_key "items", "events"
  add_foreign_key "persons", "events"
  add_foreign_key "things", "events"
end
