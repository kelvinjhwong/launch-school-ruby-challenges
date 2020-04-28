def multisum(n)
  sum = 0
  1.upto(n) do |i|
    sum += i if (i % 3 == 0) || (i % 5 == 0)
  end
  sum
end

def multisum(n)
  (1..n).reduce(0) do |accum, num|
    ((num % 3 == 0) || (num % 5 == 0)) ? (accum + num) : accum
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168