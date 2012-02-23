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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111209085325) do

  create_table "chairs", :force => true do |t|
    t.integer  "chnum"
    t.string   "chname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "sname"
    t.integer  "plan_id"
    t.integer  "fotch"
    t.integer  "lab"
    t.integer  "sem"
    t.integer  "lect"
    t.integer  "chair_id"
    t.integer  "cfaculty"
    t.integer  "mywork"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculties", :force => true do |t|
    t.string   "short_name"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flows", :force => true do |t|
    t.integer  "group_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.text     "numb_gr"
    t.integer  "gcount"
    t.integer  "plan_id"
    t.integer  "semester_id"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "flow_id"
    t.integer  "room_id"
    t.integer  "itype"
    t.integer  "inum"
    t.integer  "wday"
    t.date     "start_at"
    t.date     "finish_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "rname"
    t.string   "audience"
    t.integer  "rcount_aud"
    t.string   "comment"
    t.integer  "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", :force => true do |t|
    t.integer  "year"
    t.boolean  "semnum"
    t.integer  "wcount"
    t.date     "stsem"
    t.date     "finsem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "sname"
    t.string   "last_name"
    t.string   "tlogin"
    t.string   "scrank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "role"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
