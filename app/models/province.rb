class Province < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_province
end
