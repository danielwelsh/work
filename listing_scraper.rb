require_relative 'house'
require 'nokogiri'
require 'open-uri'
require_relative 'formating_module'
require 'sqlite3'


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

  def mls_listing_id
    id = @doc.css("span[class='MLS']").text
    while item_found?(id)
      match = id.match(/[#]\s([A-Z]\d+)/)
      @args[:mls_listing_id] = match[1]
    end
  end

  def address
    address = @doc.css('h2[class="propertyAddressHeader"]')
    while item_found?(address)
      address = address.children.text
      address = format_address(address)
      @args[:street] = address[0]
      @args[:city] = address[1]
      @args[:province] = address[2]
      @args[:postal_code] = address[3]
    end
  end


  def list_price
    price = @doc.css("div[class='sticky_price']").text
    while item_found?(price)
      number = ''
      price.scan(/\d/) { |match| number += match }
      @args[:list_price] = number.to_i
    end
  end

  def building_type
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    while item_found?(left_column)
      @args[format_sym(left_column[0].children[1].children.children[0].text).to_sym] = format_sym(left_column[0].children[1].children.children[1].text).to_s
    end
  end

  def bedrooms
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    while item_found?(left_column)
      @args[format_sym(left_column[0].children[3].children.children[0].text).to_sym] = format_sym(left_column[0].children[3].children.children[1].text).to_i
    end
  end

  def bathrooms
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    while item_found?(left_column)
      @args[format_sym(left_column[0].children[5].children.children[0].text).to_sym] = format_sym(left_column[0].children[5].children.children[1].text).to_i
    end
  end

  def living_space
    left_column = ''
    left_column = @main_doc.css("ul[class='leftColumn']")
    while item_found?(left_column)
      @args[format_sym(left_column[0].children[7].children.children[0].text).to_sym] = format_sym(left_column[0].children[7].children.children[1].text).to_i
    end
  end

  def status
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    while item_found?(right_column)
      @args[format_sym(right_column[0].children[1].children.children[0].text).to_sym] = (right_column[0].children[1].children.children[1].text).downcase
    end
  end

  def days_on_market
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    while item_found?(right_column)
      @args[format_sym(right_column[0].children[3].children.children[0].text).to_sym] = format_sym(right_column[0].children[3].children.children[1].text).to_i
    end
  end

  def age_of_building
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    while item_found?(right_column)
      @args[format_sym(right_column[0].children[5].children.children[0].text).to_sym] = format_sym(right_column[0].children[5].children.children[1].text).to_i
    end
  end

  def parking_type
    right_column = ''
    right_column = @main_doc.css("ul[class='rightColumn']")
    while item_found?(right_column)
      @args[format_sym(right_column[0].children[7].children.children[0].text).to_sym] = (right_column[0].children[7].children.children[1].text).downcase
    end
  end

  def heating
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[format_sym(left_column[0].children[1].children.children[0].text).to_sym] = (left_column[0].children[1].children.children[1].text).downcase
    end
  end

  def community
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[format_sym(left_column[0].children[3].children.children[0].text).to_sym] = (left_column[0].children[3].children.children[1].text).downcase
    end
  end

  def amenities
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[format_sym(left_column[0].children[5].children.children[0].text).to_sym] = (left_column[0].children[5].children.children[1].text).downcase
    end
  end

  def balcony
    left_column = ''
    left_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(left_column)
      left_column = left_column.css("div[id='detailsList']")
      left_column = left_column.css("ul[class='leftColumn']")
      @args[format_sym(left_column[0].children[7].children.children[0].text).to_sym] = (left_column[0].children[7].children.children[1].text).downcase
    end
  end

  def basement
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[format_sym(right_column[0].children[1].children.children[0].text).to_sym] = yes_to_boolean((right_column[0].children[1].children.children[1].text).downcase)
    end
  end

  def exterior
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[format_sym(right_column[0].children[3].children.children[0].text).to_sym] = yes_to_boolean((right_column[0].children[3].children.children[1].text).downcase)
    end
  end

  def flooring
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[format_sym(right_column[0].children[5].children.children[0].text).to_sym] = yes_to_boolean((right_column[0].children[5].children.children[1].text).downcase)
    end
  end

  def roofing
    right_column = ''
    right_column = @main_doc.css("div[class='propertyDetailsComponents']")
    while item_found?(right_column)
      right_column = right_column.css("div[id='detailsList']")
      right_column = right_column.css("ul[class='rightColumn']")
      @args[format_sym(right_column[0].children[7].children.children[0].text).to_sym] = (right_column[0].children[7].children.children[1].text).downcase
    end
  end

  def property_description
    property_description = ''
    property_description = @main_doc.css("div[class='property-description-details']")
    while item_found?(property_description)
      @args[format_sym((property_description.css("h4").text)).to_sym] = property_description.css("p[class='descriptionText descText']").children.text
    end
  end

  def listing_agent
    agent = ''
    agent = @main_doc.css("div[class='property-description-details']")
    while item_found?(agent)
      agent = agent.css("p[class='descriptionText courtesy']").children.text
      @args[:listing_agent] = agent
    end
  end

  def room_details
    rows = @main_doc.css("div[class='roomsSection desktop_only']")
    while item_found?(rows)
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
    if input != [] || input != '' || input == nil
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
    living_space
    days_on_market
    amenities
    balcony
    age_of_building
    parking_type
    heating
    basement
    community
    exterior
    flooring
    roofing
    property_description
    listing_agent
    room_details
    mls_listing_id
    address
  end

end
