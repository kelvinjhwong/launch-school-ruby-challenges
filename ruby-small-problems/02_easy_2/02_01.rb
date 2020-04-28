puts 'Please enter your name:'

name = gets.chomp

name = 'Teddy' if name.empty?

age = rand(20..200)

puts "#{name} is #{age} years old!"
