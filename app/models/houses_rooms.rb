class HousesRooms < ActiveRecord::Base
  belongs_to :room
  belongs_to :house



  def self.cleaner(params)
    clean = {}
    clean[:level]     = params[:level]
    clean[:dimension] = params[:dimension]
    clean[:roomtype]  = RoomType.find_by(name_room_type: params[:roomtype]).id
    clean[:house]     = House.find_by(street: params[:street]).id
    clean
  end

end
