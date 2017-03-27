class BuildingType < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_building_type
end
