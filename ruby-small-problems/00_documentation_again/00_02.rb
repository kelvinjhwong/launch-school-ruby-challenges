require 'date'

puts Date.new
# => Date object with year -4712, month 1 and day 1
puts Date.new(2016)
# => Date object with year 2016, month 1 and day 1
puts Date.new(2016, 5)
# => Date object with year 2016, month 5 and day 1
puts Date.new(2016, 5, 13)
# => Date object with year 2016, month 5 and day 13