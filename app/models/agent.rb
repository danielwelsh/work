class Agent < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_agent
end
