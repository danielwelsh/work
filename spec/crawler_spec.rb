require_relative '../crawler'


describe LinkCrawler do

  let(:webpage) { LinkCrawler.new('https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/') }

  it 'collects links from a given page' do
    webpage.find_links
    expect(webpage.found_links.length).to eq(3)
  end


end
