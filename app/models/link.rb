class Link < ActiveRecord::Base
  require_relative '../helpers/link_crawler'

  def find_links(link)
    LinkCrawler.find_links(link)
  end


end
