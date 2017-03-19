require_relative '../listing_scraper'

describe ListingScraper do
  let(:scraper) {  ListingScraper.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/') }

  it 'is able to get building type hash' do
    scraper.building_type
    expect(scraper.args[:building_type]).to eq('condo')
  end

  it "is able to get number of bedrooms" do
    scraper.bedrooms
    expect(scraper.args[:bedrooms]).to eq(2)
  end

  it "gets number of bathrooms" do
    scraper.bathrooms
    expect(scraper.args[:bathrooms]).to eq(2)
  end

  it "gets the living space" do
    scraper.living_space
    expect(scraper.args[:living_space]).to eq(1324)
  end

  it 'gets the property status' do
    scraper.status
    expect(scraper.args[:status]).to eq("for sale/active")
  end

end
