class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    create_table "roles_users", :id => false, :force => true do |t|
      t.integer "role_id", :null => false
      t.integer "user_id", :null => false
    end

    add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id", :unique => true
    
  end
  
  def self.down
    drop_table :roles
  end
end
