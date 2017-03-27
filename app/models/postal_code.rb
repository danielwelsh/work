class PostalCode < ActiveRecord::Base
  has_many :houses
end
