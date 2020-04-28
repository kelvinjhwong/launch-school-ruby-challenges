def stringy(number)
  if number.even?
    '10'*(number/2)
  else
    '1' + '01'*(number/2)
  end
end

def stringy2(number, start=1)
  case start
  when 1 then number.even? ? ('10'*(number/2)) : ('10'*(number/2) + '1')
  when 0 then number.even? ? ('01'*(number/2)) : ('01'*(number/2) + '0')
  end
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy2(6) == '101010'
puts stringy2(9, 0) == '010101010'
puts stringy2(4, 0) == '0101'
puts stringy2(7) == '1010101'