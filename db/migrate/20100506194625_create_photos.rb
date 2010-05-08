class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :activity_id
      t.integer :user_id
      t.decimal :latitude, :precision => 14, :scale => 10
      t.decimal :longitude, :precision => 14, :scale => 10
      t.decimal :altitude, :precision => 14, :scale => 10
      t.integer :place_id
      t.datetime :takendate
      t.string :datahash
      t.boolean :processed
      t.boolean :confirmed
      t.string :subjectline
      t.text :message
      t.timestamps
    end
    add_index :photos, :activity_id
    add_index :photos, :user_id
    add_index :photos, :place_id
  end
  
  def self.down
    drop_table :photos
  end
end
