class PostalCode < ActiveRecord::Base
  has_many :houses
  validates_uniqueness_of :code



  def self.cleaner(params)
    clean = {}
    clean[:code] = params[:code]
    clean
  end


end
