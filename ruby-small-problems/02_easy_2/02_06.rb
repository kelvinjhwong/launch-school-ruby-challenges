99.times { |i| puts i+1 if i.even? }

1.upto(99) { |i| puts i if i.odd? }

puts (1..99).to_a.select { |i| i.odd? }
