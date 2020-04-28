require 'pry'

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  alphanumerics = %w(1 2 3 4 5 6 7 8 9 0 a b c d e f g h i j k l m 
  n o p q r s t u v w x y z)
  alphanumeric_string_arr = string.downcase.chars.keep_if do |char|
    alphanumerics.member?(char)
  end
  alphanumeric_string = alphanumeric_string_arr.join
  palindrome?(alphanumeric_string)
end

def real_palindrome2?(string)
  palindrome?(string.downcase.delete('^a-z0-9'))
end

puts real_palindrome2?('madam') == true
puts real_palindrome2?('Madam') == true           # (case does not matter)
puts real_palindrome2?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome2?('356653') == true
puts real_palindrome2?('356a653') == true
puts real_palindrome2?('123ab321') == false
