class HousesRooms < ActiveRecord::Base
  belongs_to :room
  belongs_to :house



  def self.cleaner(params)
    clean = {}
    clean[:level]     = params[:level]
    clean[:dimension] = params[:dimension]
    clean[:roomtype_id]  = RoomType.find_by(name_room_type: params[:roomtype]).id
    clean[:house_id]     = House.find_by(street: params[:street]).id
    clean
  end

end
