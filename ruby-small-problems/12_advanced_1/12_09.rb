=begin
- Given number n
- Initialize empty array
- Compute difference d between n and array.sum
- Find the largest unit fraction, starting with 1/1, that is
  <= d; add it to our array
- Sum the array
  - if the sum is less than n, keep going
  - else if the sum is equal, stop
- Repeat until array.sum == n

=end

def egyptian(rational)
  unit_fractions = []
  fractions_sum = 0
  denom = 1
  difference = rational - fractions_sum
  loop do
    if Rational(1, denom) <= difference
      unit_fractions << denom
      fractions_sum += Rational(1, denom)
      difference = rational - fractions_sum
    end
    break if difference <= 0
    denom += 1
  end
  unit_fractions
end

def unegyptian(nums)
  nums.sum { |num| Rational(1, num) }
end

egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
