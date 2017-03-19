require_relative 'house'
require 'nokogiri'
require 'open-uri'

class ListingScraper
  attr_reader :args

  def initialize(link)
    @args = {}
    @doc = Nokogiri::HTML(open(link))
    @doc = @doc.css("div[class='listing-details-box propertyDetails contentArea']")
  end

  def list_price

  end

  def building_type
    left_column = ''
    left_column = @doc.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[1].children.children[0].text).to_sym] = format_sym(left_column[0].children[1].children.children[1].text).to_s
  end

  def bedrooms
    left_column = ''
    left_column = @doc.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[3].children.children[0].text).to_sym] = format_sym(left_column[0].children[3].children.children[1].text).to_i
  end

  def bathrooms
    left_column = ''
    left_column = @doc.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[5].children.children[0].text).to_sym] = format_sym(left_column[0].children[5].children.children[1].text).to_i
  end

  def living_space
    left_column = ''
    left_column = @doc.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[7].children.children[0].text).to_sym] = format_sym(left_column[0].children[7].children.children[1].text).to_i
  end

  def status
    right_column = ''
    right_column = @doc.css("ul[class='rightColumn']")
    @args[format_sym(right_column[0].children[1].children.children[0].text).to_sym] = (right_column[0].children[1].children.children[1].text).downcase
  end

  def days_on_market
    right_column = ''
    right_column = @doc.css("ul[class='rightColumn']")
    @args[format_sym(right_column[0].children[3].children.children[0].text).to_sym] = format_sym(right_column[0].children[3].children.children[1].text).to_i
  end

  def age_of_building
    right_column = ''
    right_column = @doc.css("ul[class='rightColumn']")
    @args[format_sym(right_column[0].children[5].children.children[0].text).to_sym] = format_sym(right_column[0].children[5].children.children[1].text).to_i
  end

  def parking_type
    right_column = ''
    right_column = @doc.css("ul[class='rightColumn']")
    @args[format_sym(right_column[0].children[7].children.children[0].text).to_sym] = (right_column[0].children[7].children.children[1].text).downcase
  end

  def heating
    left_column = ''
    left_column = @doc.css("div[class='propertyDetailsComponents']")
    left_column = left_column.css("div[id='detailsList']")
    left_column = left_column.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[1].children.children[0].text).to_sym] = (left_column[0].children[1].children.children[1].text).downcase
  end

  def community
    left_column = ''
    left_column = @doc.css("div[class='propertyDetailsComponents']")
    left_column = left_column.css("div[id='detailsList']")
    left_column = left_column.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[3].children.children[0].text).to_sym] = (left_column[0].children[3].children.children[1].text).downcase
  end


private
  def remove_colon(string)
    if string.include?(':')
      match = string.match(/(.*)([:])/)
      match[1]
    else
      string
    end
  end

  def format_sym(string)
    string = remove_colon(string)
    string = string.downcase.gsub(' ', '_')
  end

end
