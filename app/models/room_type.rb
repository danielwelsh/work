class RoomType < ActiveRecord::Base
  has_many :houses, :through => :houses_rooms
end