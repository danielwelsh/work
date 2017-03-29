class HousesRooms < ActiveRecord::Base
  belongs_to :room
  belongs_to :house
end
