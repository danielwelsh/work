class BuildingType < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_building_type




  def self.cleaner(params)
    clean = {}
    clean[:name_building_type] = params[:name_building_type]
    clean
  end


end
