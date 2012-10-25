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

ActiveRecord::Schema.define(:version => 20121025214628) do

  create_table "ideas", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "short_description"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "registrations", ["idea_id"], :name => "index_registrations_on_idea_id"
  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.text     "access_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "photo_url"
  end

end
