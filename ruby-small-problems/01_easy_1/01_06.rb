# - Split string into array of words
# - Iterach through each array element
#   - If string length is >= 5, reverse string
# - Join array elements with ' ' delimiter

def reverse_words(string)
  words = string.split
  words.each { |word| word.reverse! if word.length >= 5 }
  words.join(' ')
end

def reverse_words(string)
  string.split.each { |word| word.reverse! if word.length >= 5 }.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
