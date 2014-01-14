class Place < ActiveRecord::Base
  belongs_to :map

  geocoded_by :address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode
end
