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

  it 'returns true when we have a house' do

  end

  it 'returns false when we do not have a house' do
    scraper2 = ListingScraper.new('https://www.google.com/')
    scraper2.scrape
    new_house = House.new(scraper2.args)
    expect(new_house.this_a_house?).to eq(false)
  end

end
