require "sqlite3"

class House
  attr_reader :listing_price, :listing_id, :building_type, :status, :bedrooms, :bathrooms, :living_space, :days_on_market, :amenities, :balcony, :age_of_building, :parking_type, :heating, :basement, :community, :exterior, :flooring, :roofing

  def initialize(args)
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
    @listing_agent        = args.fetch(:listing_agent, '')
    @room_details         = args.fetch(:room_details, '')
    @mls_listing_id       = args.fetch(:mls_listing_id, '')
    @street               = args.fetch(:street, '')
    @city                 = args.fetch(:city, '')
    @province             = args.fetch(:province, '')
    @postal_code          = args.fetch(:postal_code, '')
    @db = SQLite3Database.new "housing.db"
  end

  def write_to_houses
    @db.execute("INSERT INTO players (id, listing_price, mls_listing_id, building_type, status, bedrooms, bathrooms, living_space, days_on_market, amenities, balcony, age_of_building, parking_type, heating, basement, community, exterior, flooring, roofing, property_description, listing_agent, street, city, province, postal_code, created_at, modified_at) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [@id, @listing_price, @mls_listing_id, @building_type, @status, @bedrooms, @bathrooms, @living_space, @days_on_market, @amenities, @balcony, @age_of_building, @parking_type, @heating, @basement, @community, @exterior, @flooring, @roofing, @property_description, @listing_agent, @street, @city, @province, @postal_code, DATETIME.('now'), DATETIME.('now')])

  end





end
