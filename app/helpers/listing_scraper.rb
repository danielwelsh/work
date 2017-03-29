# require_relative 'house'
# require 'nokogiri'
# require 'open-uri'
# require_relative 'formating_module'
# require 'sqlite3'
require_relative '../helpers/formating_module'

#FIXME ADD BACK BOOLEAN TEST to basement exterior and flooring
# https://www.remax.ca/ab/edmonton-real-estate/na-1902-9923-103-street-na-wp_id167819998-lst/
class ListingScraper
  attr_reader :args
  include ScrapingFormatting

  def initialize(link)
    @link =  link
    @args = {}
    @doc = Nokogiri::HTML(open(@link))
    @main_doc = @doc.css("div[class='listing-details-box propertyDetails contentArea']")
  end

  def run
    scrape
    populate_ids
  end



private
  def mls_listing_id
    id = @doc.css("span[class='MLS']").text
    if item_found?(id)
      match = id.match(/[#]\s([A-Z]\d+)/)
      @args[:mls_listing_id] = match[1]
    end
  end

  def address
    address = @doc.css('h2[class="propertyAddressHeader"]')
    if item_found?(address)
      address = address.children.text
      address = format_address(address)
      @args[:street] = address[0]
      @args[:name_city] = address[1]
      @args[:name_province] = address[2]
      @args[:code] = address[3]
    end
  end


  def list_price
    price = @main_doc.css("div[itemprop='price']").text
    if item_found?(price)
      number = ''
      price.scan(/\d/) { |match| number += match }
      @args[:list_price] = number.to_i
      @args[:currency] = 'CAD'
    end
  end

  def building_type
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    if item_found?(left_column)
      @args[:name_building_type] = format_sym(left_column[0].children[1].children.children[1].text).to_s
    end
  end

  def bedrooms
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    if item_found?(left_column)
      @args[:bedrooms] = format_sym(left_column[0].children[3].children.children[1].text).to_i
    end
  end

  def bathrooms
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    if item_found?(left_column)
      @args[:bathrooms] = format_sym(left_column[0].children[5].children.children[1].text).to_i
    end
  end

  def sq_feet
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    if item_found?(left_column)
      @args[:sq_feet] = format_sym(left_column[0].children[7].children.children[1].text).to_i
    end
  end

  def status
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    if item_found?(right_column)
      @args[:status] = (right_column[0].children[1].children.children[1].text).downcase
    end
  end

  def days_on_market
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    if item_found?(right_column)
      @args[:days_on_market] = format_sym(right_column[0].children[3].children.children[1].text).to_i
    end
  end

  def age_of_building
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    if item_found?(right_column)
      @args[:age_of_building] = format_sym(right_column[0].children[5].children.children[1].text).to_i
    end
  end

  def parking_type
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    if item_found?(right_column)
      @args[:parking_type] = (right_column[0].children[7].children.children[1].text).downcase
    end
  end

  def heating
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[:heating] = (left_column[0].children[1].children.children[1].text).downcase
    end
  end

  def name_community
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[:name_community] = (left_column[0].children[3].children.children[1].text).downcase
    end
  end

  def amenities
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[:amenities] = (left_column[0].children[5].children.children[1].text).downcase
    end
  end

  def balcony
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[:balcony] = (left_column[0].children[7].children.children[1].text).downcase
    end
  end

  def basement
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[:basement] = (right_column[0].children[1].children.children[1].text).downcase
    end
  end

  def exterior
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[:exterior] = (right_column[0].children[3].children.children[1].text).downcase
    end
  end

  def flooring
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[:flooring] = (right_column[0].children[5].children.children[1].text).downcase
    end
  end

  def roofing
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    if item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[:roofing] = (right_column[0].children[7].children.children[1].text).downcase
    end
  end

  def property_description
    property_description = ''
    property_description = @main_doc.css("div[class='property-description-details']")
    if item_found?(property_description)
      @args[:property_description] = property_description.css("p[class='descriptionText descText']").children.text
    end
  end

  def name_agent
    agent = ''
    agent = @main_doc.css("div[class='property-description-details']")
    if item_found?(agent)
      agent = agent.css("p[class='descriptionText courtesy']").children.text
      @args[:name_agent] = agent
    end
  end

  def room_details
    rows = @main_doc.css("div[class='roomsSection desktop_only']")
    if item_found?(rows)
      rows = rows.css('tr')

      rows_info = []
      rows.each_with_index do |row, index|
        details = {}
        next if index == 0
        if row.children[1].text == ''
          #This will return the previous selection
          @proper_level
        else
          @proper_level = row.children[1].text
        end

        details[:level] = @proper_level
        details[:room_name] = row.children[3].text
        details[:dimension] = row.children[5].text
        rows_info << details
      end
      @args[:room_details] = rows_info
    end
  end

  def item_found?(input)
    input = input.to_s
    if input == '[]' || input == '' || input == nil
      return false
    else
      return true
    end
  end

  def scrape
    list_price
    mls_listing_id
    building_type
    status
    bedrooms
    bathrooms
    sq_feet
    days_on_market
    amenities
    balcony
    age_of_building
    parking_type
    heating
    basement
    name_community
    exterior
    flooring
    roofing
    property_description
    room_details
    mls_listing_id
    address
    name_agent
  end

  def populate_ids
    @args[:agent_id] = Agent.find_by("name_agent = '#{@args[:name_agent]}'").id
    @args[:building_type_id] = BuildingType.find_by("name_building_type = '#{@args[:name_building_type]}'").id
    @args[:province_id] = Province.find_by("name_province = '#{@args[:name_province]}'").id
    @args[:city_id] = City.find_by("name_city = '#{@args[:name_city]}'").id
    @args[:postal_code_id] = PostalCode.find_by("code = '#{@args[:code]}'").id
  end

end
