class City < ActiveRecord::Base
  before_create :params_cleaner(params)
  has_many :houses
  validates_uniqueness_of :name_city





  def self.cleaner(params)
    clean = {}
    clean[:name_city] = params[:name_city]
    clean
  end


end