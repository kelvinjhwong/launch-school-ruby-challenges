def swapcase(string)
  string.chars.each do |char|
    char == char.downcase ? char.upcase! : char.downcase!
  end.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
