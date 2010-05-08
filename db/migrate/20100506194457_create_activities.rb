class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.integer :activity_type
      t.integer :points
      t.integer :friend_points
      t.integer :photo_points
      t.integer :place_points
      t.integer :bonus_points
      t.integer :quest_id
      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :quest_id
  end
  
  def self.down
    drop_table :activities
  end
end
