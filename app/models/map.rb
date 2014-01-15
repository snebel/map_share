class Map < ActiveRecord::Base
  belongs_to :user
  has_many :map_memberships
  #has_many :places
  has_many :places, through: :map_memberships

  geocoded_by :city, :latitude  => :center_lat, :longitude => :center_lng
  after_validation :geocode

  # remove bandmembership linking self, place
  # make a copy of place and add it to self.places
  def adjust_place(place)
    MapMembership.where(map_id: self.id, place_id: place.id).delete_all
    place_copy = Place.create(
      title: place.title,
      address: place.address,
      link: place.link,
      description: place.description
    )
    self.places << place_copy
  end
end