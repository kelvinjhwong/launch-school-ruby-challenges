puts 'What is the bill?'
bill = gets.chomp.to_f

puts 'What is the tip percentage?'
percentage = gets.chomp.to_f

tip = bill * percentage
total = bill + tip

puts "The tip is $#{sprintf("%#.2f", tip)}"
puts "The total is $#{sprintf("%#.2f", total)}"
