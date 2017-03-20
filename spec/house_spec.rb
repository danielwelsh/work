require_relative '../house'
require_relative '../listing_scraper'


describe House do
  let(:listing) { ListingScraper.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/') }
  let(:main_house) { House.new}

  it 'determines it we have scraped a house' do
    listing.scrape
    house = House.new(listing.args)
    expect(house.is_this_a_house?).to be(true)
  end

end
