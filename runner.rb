require_relative 'listing_scraper'
require_relative 'house'

listing = ListingScraper.new('https://www.google.com')
listing.scrape
house = House.new(listing.args)
house.write_to_houses
