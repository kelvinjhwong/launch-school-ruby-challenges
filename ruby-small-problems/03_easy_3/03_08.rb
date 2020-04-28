def palindrome?(string)
  string == string.reverse
end

def palindrome_array?(array)
  array == array.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

puts palindrome_array?(['a', 'b', 'a']) == true
puts palindrome_array?(['A', 'b', 'a']) == false          # (case matters)
puts palindrome_array?(['a', 'b', ' ', "'", 'b', 'a']) == false # (all characters matter)
puts palindrome_array?(['3', '2', '3']) == true
