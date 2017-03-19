

module ScrapingFormatying

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


end
