def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

def power(num, exponent)
  result = num
  (exponent-1).times { result = multiply(result, num) }
  result
end

puts power(5, 3)
puts power(2, 7)
