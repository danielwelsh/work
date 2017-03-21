require_relative '../house'
require_relative '../listing_scraper'


describe House do
  let(:listing) { ListingScraper.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/') }
  let(:main_house) { House.new}

  it 'determines it we have scraped a house' do
    listing.scrape
    house = House.new(listing.args)
    expect(house.this_a_house?).to be(true)
  end

  it 'returns false when we do not have a house' do
    scraper2 = ListingScraper.new('https://www.google.com/')
    scraper2.scrape
    house = House.new(scraper2.args)
    expect(house.this_a_house?).to eq(false)
  end

  it 'creates rooms based on data read in' do
    listing.scrape
    house = House.new(listing.args)
    house.create_rooms
    expect(house.rooms[0]).to be_a(Room)
  end

  it 'does not create rooms if there are none found' do
    scraper2 = ListingScraper.new('https://www.google.com/')
    scraper2.scrape
    house = House.new(scraper2.args)
    expect(house.rooms).to eq(nil)
  end

end
