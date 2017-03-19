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
    left_column = @doc.css("ul[class='leftColumn']")
    @args[format_sym(left_column[0].children[1].children.children[0].text).to_sym] = format_sym(left_column[0].children[1].children.children[1].text).to_sym
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
