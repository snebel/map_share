class Place < ActiveRecord::Base
  has_many :maps, through: :map_memberships
  has_many :map_memberships

  geocoded_by :address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode
end
