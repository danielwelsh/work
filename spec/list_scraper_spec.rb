require_relative '../listing_scraper'

describe ListingScraper do
  let(:scraper) {  ListingScraper.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/') }

  # it 'gets building type hash' do
  #   scraper.building_type
  #   expect(scraper.args[:building_type]).to eq('condo')
  # end

  # it "gets number of bedrooms" do
  #   scraper.bedrooms
  #   expect(scraper.args[:bedrooms]).to eq(2)
  # end

  # it "gets number of bathrooms" do
  #   scraper.bathrooms
  #   expect(scraper.args[:bathrooms]).to eq(2)
  # end

  # it "gets the living space" do
  #   scraper.living_space
  #   expect(scraper.args[:living_space]).to eq(1324)
  # end

  # it 'gets the property status' do
  #   scraper.status
  #   expect(scraper.args[:status]).to eq("for sale/active")
  # end

  # it 'gets the days on market' do
  #   scraper.days_on_market
  #   expect(scraper.args[:days_on_market]).to eq(6)
  # end

  # it "gets the age of the building" do
  #   scraper.age_of_building
  #   expect(scraper.args[:age_of_building]).to eq(1977)
  # end

  # it "gets the type of parking" do
  #   scraper.parking_type
  #   expect(scraper.args[:parking_type]).to eq("parkade; see remarks; stall; underground")
  # end

  # it 'gets the type of heating' do
  #   scraper.heating
  #   expect(scraper.args[:heating]).to eq('baseboard, hot water')
  # end

  # it 'gets the community' do
  #   scraper.community
  #   expect(scraper.args[:community]).to eq('downtown_edmo')
  # end

  # it 'gets the amenities' do
  #   scraper.amenities
  #   expect(scraper.args[:amenities]).to eq('playground nearby, public transportation, ravine v')
  # end

  # it 'gets the balcony' do
  #   scraper.balcony
  #   expect(scraper.args[:balcony]).to eq(true)
  # end

end
