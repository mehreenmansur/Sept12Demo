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

ActiveRecord::Schema.define(version: 20190908150622) do

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

  add_foreign_key "event_people", "events"
  add_foreign_key "event_things", "events"
  add_foreign_key "items", "events"
  add_foreign_key "persons", "events"
  add_foreign_key "things", "events"
end
