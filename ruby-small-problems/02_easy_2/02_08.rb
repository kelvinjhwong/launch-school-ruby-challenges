def prompt(message)
  puts ">> #{message}"
end

prompt 'Please enter an integer greater than 0:'
number = gets.to_i

prompt "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = (1..number).sum
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = (1..number).reduce { |prod, num| prod*num }
  puts "The product of the integers between 1 and #{number} is #{product}."
end
