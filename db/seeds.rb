require_relative '../app/helpers/listing_scraper'
require_relative '../app/helpers/link_crawler'
require_relative '../app/helpers/listing_scraper'
require_relative '../app/models/agent'
require_relative '../app/models/building_type'
require_relative '../app/models/city'
require_relative '../app/models/community'
require_relative '../app/models/house'
require_relative '../app/models/link'
require_relative '../app/models/postal_code'
require_relative '../app/models/province'
require_relative '../app/models/room_type'
require_relative '../app/models/houses_rooms'


crawler = LinkCrawler.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/')

links = crawler.found_links

links.each do |link|
  listing = ListingScraper.new(link)
  listing.get
  params = listing.args

  params[:room_details].each do |room|
    RoomType.create(RoomType.cleaner(params))
    clean
    HousesRooms.create(HousesRooms.cleaner(params))
  end

  City.create(City.cleaner(params))
  Agent.create(Agent.cleaner(params))
  BuildingType.create(BuildingType.cleaner(params))
  Province.create(Province.cleaner(params))
  Community.create(Community.cleaner(params))
  PostalCode.create(PostalCode.cleaner(params))

  House.create(House.cleaner(params))
end

