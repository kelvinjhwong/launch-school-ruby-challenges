def prompt(message)
  puts "==> #{message}"
end

numbers = []

keys = ['1st', '2nd', '3rd', '4th', '5th', 'last']
keys.each_with_index do |key, index|
  prompt "Enter the #{key} number:"
  numbers[index] = gets.to_i
end

if numbers[0..4].member? numbers[5]
  puts "The number #{numbers[5]} appears in #{numbers[0..4]}."
else
  puts "The number #{numbers[5]} does not appear in #{numbers[0..4]}."
end
