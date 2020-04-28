DIGIT_STRINGS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  string = ''
  loop do
    num, remainder = num.divmod(10)
    string.prepend(DIGIT_STRINGS[remainder])
    break if num == 0
  end
  string
end

def signed_integer_to_string(num)
  if num == 0
    '0'
  elsif num.positive?
    '+' + integer_to_string(num)
  else
    '-' + integer_to_string(-num)
  end
end

def signed_integer_to_string(num)
  case num <=> 0
  when 0 then '0'
  when 1 then '+' + integer_to_string(num)
  when -1 then '-' + integer_to_string(-num)
  end
end

def signed_integer_to_string(num)
  sign = case num <=> 0
         when 0 then ''
         when 1 then '+'
         when -1 then '-'
         end
  sign + integer_to_string(num.abs)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
