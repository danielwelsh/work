require_relative 'listing_scraper'
require_relative 'house'



# listing = ListingScraper.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/')
# listing.scrape
# house = House.new(listing.args)
# house.write_to_houses

db = SQLite3::Database.new "links.db"
links = db.execute('select * from links')


links.each do |link|
  listing = ListingScraper.new(link[1])
  listing.scrape
  house = House.new(listing.args)
end

LinkCrawler.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/')

links = LinkCrawler.found_links

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
  House.create(args)
end

