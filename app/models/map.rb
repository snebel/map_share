class Map < ActiveRecord::Base
	has_many :places
  belongs_to :user

  geocoded_by :city, :latitude  => :center_lat, :longitude => :center_lng
  after_validation :geocode
end