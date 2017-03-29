class Province < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_province


  def self.cleaner(params)
    clean = {}
    clean[:name_province] = params[:name_province]
    clean
  end



end
