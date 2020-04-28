def uniq_digits?(num)
  digits = num.to_s.chars
  digits == digits.uniq
end

def featured(num)
  num += 1
  quotient, remainder = num / 7, num % 7
  next_odd_multiple = quotient.odd? ? num - remainder + 14 : num - remainder + 7
  loop do
    return next_odd_multiple if uniq_digits?(next_odd_multiple)
    next_odd_multiple += 14
    break if next_odd_multiple > 9_876_543_210
  end
  'There is no possible number that fulfills those requirements.'
end

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
