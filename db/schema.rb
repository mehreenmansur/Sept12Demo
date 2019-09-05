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

ActiveRecord::Schema.define(version: 20190905113103) do

  create_table "signup_items", force: :cascade do |t|
    t.string   "owner_type",        limit: 255,               null: false
    t.integer  "owner_id",          limit: 4,                 null: false
    t.text     "title",             limit: 65535,             null: false
    t.integer  "item_type",         limit: 4
    t.integer  "quantity",          limit: 4
    t.integer  "achieved_quantity", limit: 4,     default: 0, null: false
    t.datetime "due_date"
    t.string   "due_time",          limit: 255
    t.text     "description",       limit: 65535
    t.integer  "sort_order",        limit: 4,     default: 0, null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "singups", force: :cascade do |t|
    t.string   "title",                  limit: 255,                   null: false
    t.integer  "schoolclass_id",         limit: 4
    t.text     "description",            limit: 65535
    t.text     "description_html",       limit: 65535
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

end
