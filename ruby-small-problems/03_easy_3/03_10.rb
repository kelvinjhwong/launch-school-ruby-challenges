# Does not work for numbers with leading 0s

require 'pry'

def palindromic_number?(number)
  number = number.to_s
  binding.pry
  while number.start_with? '0'
    number = number[1..-1]
  end
  number == number.reverse
end

puts palindromic_number?(034543) == true
puts palindromic_number?(00123210) == false
puts palindromic_number?(00022) == true
puts palindromic_number?(05) == true

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true