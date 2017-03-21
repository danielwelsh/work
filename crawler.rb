require_relative 'house'
require 'nokogiri'
require 'open-uri'
require_relative 'formating_module'
require 'sqlite3'

class LinkCrawler
  attr_reader :found_links

  def initialize(link)
    @found_links = [link]
    @db = SQLite3::Database.new "links.db"
  end

  def find_links(link = @found_links[0], index = 0, no_new_links = false)
    return false if no_new_links == true
    return false if link == []
    @doc = Nokogiri::HTML(open(link))
    doc = @doc.css('dt[class="teaserImage"]')
    doc.each_with_index do |section, index|
      value = ''
      value = doc[index].children[1].attributes['href'].value
      if @found_links.include?(value)
        no_new_links = true
      else
        value = concatenate_prefix(value)
        @found_links << value
        write_link_to_database(value)
        p read_from_database
      end
    end

    index += 1
    find_links(@found_links[index], index, no_new_links)
  end

  def concatenate_prefix(link)
    link = 'https://www.remax.ca' + link
  end

  def write_link_to_database(value)
    @db.execute('INSERT INTO links (link) VALUES (?)', [value])
  end

  def read_from_database
    @db.execute('SELECT * FROM links')
  end


end
