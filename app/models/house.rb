class House < ActiveRecord::Base
  belongs_to :postal_code
  belongs_to :agent
  belongs_to :building_type
  belongs_to :city
  belongs_to :community
  belongs_to :province
  has_many :rooms

  validates_uniqueness_of :mls_listing_id





















end


#   require "sqlite3"
# require "date"
# require_relative "room"

# select list_price, mls_listing_id, building_type, status, bedrooms, bathrooms, living_space, days_on_market, amenities, balcony, age_of_building, parking_type, heating, basement, community, exterior, flooring, roofing, listing_agent, street, city, province, postal_code from houses;

# class House









  # attr_reader :listing_price, :currency, :listing_id, :building_type, :status, :bedrooms, :bathrooms, :living_space, :days_on_market, :amenities, :balcony, :age_of_building, :parking_type, :heating, :basement, :community, :exterior, :flooring, :roofing, :rooms

  # def initialize(args)
  #   @args                 = args
  #   @listing_price        = args.fetch(:listing_price, '')
  #   @currency             = args.fetch(:currency, '')
  #   @mls_listing_id       = args.fetch(:mls_listing_id, '')
  #   @building_type        = args.fetch(:building_type, '')
  #   @status               = args.fetch(:status, '')
  #   @bedrooms             = args.fetch(:bedrooms, '')
  #   @bathrooms            = args.fetch(:bathrooms, '')
  #   @living_space         = args.fetch(:living_space, '')
  #   @days_on_market       = args.fetch(:days_on_market, '')
  #   @amenities            = args.fetch(:amenities, '')
  #   @balcony              = args.fetch(:balcony, '')
  #   @age_of_building      = args.fetch(:age_of_building, '')
  #   @parking_type         = args.fetch(:parking_type, '')
  #   @heating              = args.fetch(:heating, '')
  #   @basement             = args.fetch(:basement, '')
  #   @community            = args.fetch(:community, '')
  #   @exterior             = args.fetch(:exterior, '')
  #   @flooring             = args.fetch(:flooring, '')
  #   @roofing              = args.fetch(:roofing, '')
  #   @property_description = args.fetch(:property_description, '')
  #   #FIXME Clean the data for listing agent
  #   @listing_agent        = args.fetch(:listing_agent, '')
  #   @street               = args.fetch(:street, '')
  #   @city                 = args.fetch(:city, '')
  #   @province             = args.fetch(:province, '')
  #   @postal_code          = args.fetch(:postal_code, '')
  #   # @rooms                = create_rooms
  #   @db = SQLite3::Database.new "housing.db"
  #   #FIXME: Need to get DateTime working
  #   @initalize_time       = 'hello'
  # end

  # def this_a_house?
  #   if @args.length > 5
  #       return true
  #   else
  #       return false
  #   end
  # end

  #FIXME create rooms integration
  # def create_rooms
  #   @rooms = []
  #   if this_a_house?
  #       @args[:room_details].each do |room|
  #           @rooms << Room.new(room)
  #       end
  #   end
  # end







# end


