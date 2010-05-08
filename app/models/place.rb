class Place < ActiveRecord::Base
  belongs_to :venue_type
  belongs_to :activity
  accepts_nested_attributes_for :venue_type

  attr_accessible :name, :description, :address, :latitude, :longitude, :altitude, :venue_type_id
end
