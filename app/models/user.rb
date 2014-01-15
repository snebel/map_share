class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #attr_accessible :email, :password, :password_confirmation
  has_many :maps
  has_many :requests

  def add_map_copy(map)
    map_copy = Map.new(
      title: map.title,
      city: map.city,
      user_id: self.id
    )
    map_copy.places = map.places
    map_copy.save
  end
end
