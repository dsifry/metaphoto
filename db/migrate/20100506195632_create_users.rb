class CreateUsers < ActiveRecord::Migration
  def self.up
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
    add_index :users, :name
    add_index :users, :facebook_id
  end
  
  def self.down
    drop_table :users
  end
end
