class PostalCode < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :code
end
