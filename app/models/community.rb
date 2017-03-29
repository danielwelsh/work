class Community < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_community



  def self.cleaner(params)
    clean = {}
    clean[:name_community] = params[:name_community]
    clean
  end

end
