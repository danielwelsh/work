require "sqlite3"
require "date"
require_relative "room"


class House
  attr_reader :listing_price, :listing_id, :building_type, :status, :bedrooms, :bathrooms, :living_space, :days_on_market, :amenities, :balcony, :age_of_building, :parking_type, :heating, :basement, :community, :exterior, :flooring, :roofing, :rooms

  def initialize(args)
    @args                 = args
    @listing_price        = args.fetch(:listing_price, '')
    @mls_listing_id       = args.fetch(:mls_listing_id, '')
    @building_type        = args.fetch(:building_type, '')
    @status               = args.fetch(:status, '')
    @bedrooms             = args.fetch(:bedrooms, '')
    @bathrooms            = args.fetch(:bathrooms, '')
    @living_space         = args.fetch(:living_space, '')
    @days_on_market       = args.fetch(:days_on_market, '')
    @amenities            = args.fetch(:amenities, '')
    @balcony              = args.fetch(:balcony, '')
    @age_of_building      = args.fetch(:age_of_building, '')
    @parking_type         = args.fetch(:parking_type, '')
    @heating              = args.fetch(:heating, '')
    @basement             = args.fetch(:basement, '')
    @community            = args.fetch(:community, '')
    @exterior             = args.fetch(:exterior, '')
    @flooring             = args.fetch(:flooring, '')
    @roofing              = args.fetch(:roofing, '')
    @property_description = args.fetch(:property_description, '')
    #FIXME Clean the data for listing agent
    @listing_agent        = args.fetch(:listing_agent, '')
    @mls_listing_id       = args.fetch(:mls_listing_id, '')
    @street               = args.fetch(:street, '')
    @city                 = args.fetch(:city, '')
    @province             = args.fetch(:province, '')
    @postal_code          = args.fetch(:postal_code, '')
    # @rooms                = create_rooms
    @db = SQLite3::Database.new "housing.db"
    #FIXME: Need to get DateTime working
    @initalize_time       = 'hello'
  end

  def this_a_house?
    if @args.length > 5
        return true
    else
        return false
    end
  end

  def write_to_houses
    if this_a_house?
        @db.execute("INSERT INTO houses (id, list_price, mls_listing_id, building_type, status, bedrooms, bathrooms, living_space, days_on_market, amenities, balcony, age_of_building, parking_type, heating, basement, community, exterior, flooring, roofing, property_description, listing_agent, street, city, province, postal_code, created_at, modified_at) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [@id, @listing_price, @mls_listing_id, @building_type, @status, @bedrooms, @bathrooms, @living_space, @days_on_market, @amenities, @balcony, @age_of_building, @parking_type, @heating, @basement, @community, @exterior, @flooring, @roofing, @property_description, @listing_agent, @street, @city, @province, @postal_code, @initalize_time, @initalize_time])
    end
  end

  def read_from_database
    @db.execute("select * from houses")
  end


  #FIXME create rooms integration
  # def create_rooms
  #   @rooms = []
  #   if this_a_house?
  #       @args[:room_details].each do |room|
  #           @rooms << Room.new(room)
  #       end
  #   end
  # end







end
