class RoomType < ActiveRecord::Base
  has_many :houses
  has_many :houses, :through => :houses_rooms


  def self.cleaner(params)
    clean = {}
    clean[:name_room_type] = params[:name_room_type]
    clean
  end

end
