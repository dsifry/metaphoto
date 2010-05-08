class VenueType < ActiveRecord::Base
  has_many :places
  
  attr_accessible :name, :description
end
