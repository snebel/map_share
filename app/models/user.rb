class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #attr_accessible :email, :password, :password_confirmation
  has_many :maps
  has_many :requests

  def add_map_copy(map)
    map_copy = Map.create(
      title: map.title,
      city: map.city,
      user_id: self.id,
      places: map.places
    )
  # seems to have uninteded consequence of deleting
  # the places from map... though only in browser not in rails console
  end
end
