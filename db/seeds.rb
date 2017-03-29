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
require_relative '../app/models/room'


crawler = LinkCrawler.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/')

links = crawler.found_links

links.each do |link|
  listing = ListingScraper.new(link)
  listing.run
  args = listing.args

  Agent.create(args)
  BuildingType.create(args)
  City.create(args)
  Province.create(args)
  Community.create(args)
  PostalCode.create(args)
  listing.populate_ids
  args = listing.args
  House.create(args)
end

