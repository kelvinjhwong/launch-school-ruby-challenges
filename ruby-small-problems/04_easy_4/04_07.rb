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

def string_to_integer(string)
  int = 0
  string.length.times do |place|
    int = int * 10 + char_to_digit(string[place])
  end
  int
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

HEX_DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3,
                '4' => 4, '5' => 5, '6' => 6, '7' => 7,
                '8' => 8, '9' => 9, 'A' => 10, 'B' => 11,
                'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(string)
  int = 0
  string.length.times do |place|
    int = int * 16 + HEX_DIGITS[string[place].upcase]
  end
  int
end

puts hexadecimal_to_integer('4D9f') == 19871
