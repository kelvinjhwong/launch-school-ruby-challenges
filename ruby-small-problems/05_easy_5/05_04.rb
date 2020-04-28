def swap(string)
  swapped_words = string.split.map do |word|
    last_letter = word[-1]
    word[-1] = word[0]
    word[0] = last_letter
    word
  end
  swapped_words.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
