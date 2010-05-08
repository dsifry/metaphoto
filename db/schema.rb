# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100508043217) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_type"
    t.integer  "points"
    t.integer  "friend_points"
    t.integer  "photo_points"
    t.integer  "place_points"
    t.integer  "bonus_points"
    t.integer  "quest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["quest_id"], :name => "index_activities_on_quest_id"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.decimal  "latitude",         :precision => 14, :scale => 10
    t.decimal  "longitude",        :precision => 14, :scale => 10
    t.decimal  "altitude",         :precision => 14, :scale => 10
    t.integer  "place_id"
    t.datetime "takendate"
    t.string   "datahash"
    t.boolean  "processed"
    t.boolean  "confirmed"
    t.string   "subjectline"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "photos", ["activity_id"], :name => "index_photos_on_activity_id"
  add_index "photos", ["place_id"], :name => "index_photos_on_place_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "altitude"
    t.integer  "venue_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                              :null => false
    t.integer  "login_count",                     :default => 0, :null => false
    t.integer  "failed_login_count",              :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "facebook_id",        :limit => 8
    t.string   "session_key"
  end

  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"
  add_index "users", ["name"], :name => "index_users_on_name"

  create_table "venue_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
