DIGIT_STRINGS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  string = ''
  array = num.divmod(10)
  while array[0] != 0
    string.prepend(DIGIT_STRINGS[array[1]])
    array = array[0].divmod(10)
  end
  string.prepend(DIGIT_STRINGS[array[1]])
end

def integer_to_string(num)
  string = ''
  loop do
    num, remainder = num.divmod(10)
    string.prepend(DIGIT_STRINGS[remainder])
    break if num == 0
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
