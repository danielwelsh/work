

module ScrapingFormatting

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

  def yes_to_boolean(string)
    if string == 'yes'
      true
    elsif string == 'no'
      false
    else
      string
    end
  end

  def format_address(address)
    address = address.split(',')
    address.map! do |part|
      part.downcase.strip
    end
    address
  end


end
