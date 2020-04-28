2.step(99, 2) { |i| puts i }

1.upto(99) { |i| puts i if i.even? }

puts (1..99).select(&:even?)
