class Agent < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :name_agent


  def self.cleaner(params)
    clean = {}
    clean[:name_agent] = params[:name_agent]
    clean
  end

end
