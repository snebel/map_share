class Map < ActiveRecord::Base
  belongs_to :user

  # has_many :places, through: :map_memberships
  has_many :places
  has_many :band_memberships

  geocoded_by :city, :latitude  => :center_lat, :longitude => :center_lng
  after_validation :geocode
end