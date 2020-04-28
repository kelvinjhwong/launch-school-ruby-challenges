def char_to_digit(char)
  %w(0 1 2 3 4 5 6 7 8 9).index(char)
end

def string_to_integer(string)
  int = 0
  (string.length).times do |place|
    int += char_to_digit(string[-1-place]) * (10 ** place)
  end
  int
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then sign = -1
  when '+' then sign = 1
  else
    sign = 1
    string = '+' + string
  end
  sign * string_to_integer(string[1..-1])
end

def string_to_signed_integer(string)
  sign = (string[0] == '-' ? -1 : 1)
  unsigned_num = ( string.start_with?('-', '+') ? string[1..-1] : string)
  sign * string_to_integer(unsigned_num)
end


puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
