class City < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_city





  def self.cleaner(params)
    clean = {}
    clean[:name_city] = params[:name_city]
    clean
  end


end