require_relative 'listing_scraper'
require_relative 'house'

listing = ListingScraper.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/')
p listing
house = House.new(listing.args)
house.write_to_houses
