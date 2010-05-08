class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :altitude
      t.integer :venue_type_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :places
  end
end
