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

ActiveRecord::Schema.define(version: 20160430015840) do

  create_table "administrators", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "casusers", force: :cascade do |t|
    t.string   "cas_user_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "children", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "school"
    t.string   "grade"
    t.string   "time_slot"
    t.string   "competitions"
    t.text     "description"
    t.boolean  "visible"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "group_id"
  end

  create_table "fbusers", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  create_table "groupinvs", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "mentor_id"
    t.boolean  "send_by_mentor", default: false
    t.string   "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.string   "time_slot"
    t.string   "competitions"
    t.text     "description"
    t.boolean  "visible"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "completed"
    t.boolean  "need_mentor"
    t.integer  "mentor_id"
    t.integer  "admin_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "school"
    t.string   "grade"
    t.string   "time_slot"
    t.string   "competitions"
    t.text     "description"
    t.boolean  "visible"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "rglusers", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "encrypted_password"
    t.string   "role"
    t.string   "salt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "reset_digest"
    t.string   "reset_token"
    t.datetime "reset_sent_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "role"
    t.string   "username"
    t.datetime "last_login_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
