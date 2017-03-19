

class House
  attr_reader :listing_price, :listing_id, :building_type, :status, :bedrooms, :bathrooms, :living_space, :days_on_market, :amenities, :balcony, :age_of_building, :parking_type, :heating, :basement, :community, :exterior, :flooring, :roofing

  def initialize(args)
    @listing_price = args.fetch(:listing_price, '')
    @listing_id = args.fetch(:listing_id, '')
    @building_type = args.fetch(:building_type, '')
    @status = args.fetch(:status, '')
    @bedrooms = args.fetch(:bedrooms, '')
    @bathrooms = args.fetch(:bathrooms, '')
    @living_space = args.fetch(:living_space, '')
    @days_on_market = args.fetch(:days_on_market, '')
    @amenities = args.fetch(:amenities, '')
    @balcony = args.fetch(:balcony, '')
    @age_of_building = args.fetch(:age_of_building, '')
    @parking_type = args.fetch(:parking_type, '')
    @heating = args.fetch(:heating, '')
    @basement = args.fetch(:basement, '')
    @community = args.fetch(:community, '')
    @exterior = args.fetch(:exterior, '')
    @flooring = args.fetch(:flooring, '')
    @roofing = args.fetch(:roofing, '')
  end

end
