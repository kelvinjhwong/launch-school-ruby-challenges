# Assume: no need to bother with non-positive years

def ordinal_indicator(num)
  if (num % 10 == 1) && (num % 100 != 11)
    'st'
  elsif (num % 10 == 2) && (num % 100 != 12)
    'nd'
  elsif (num % 10 == 3) && (num % 100 != 13)
    'rd'
  else
    'th'
  end
end

def century(year)
  century_num = (year - 1)/100 + 1
  century_num.to_s + ordinal_indicator(century_num)
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
