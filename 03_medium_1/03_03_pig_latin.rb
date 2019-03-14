=begin

***Did not watch solution video***

Intput
- String
- 1 or more words

Output
- New String
- Same number of words
- Each word transformed according to a set of rules

Examples / rules:
- 

Edge cases / assumptions:
- Assume valid input - non-empty String of letters
- Assume words are delimited by exactly 1 space char
- Ignore case

Algorithm:
- Given a word, check its first few chars for consonant sound
  - Check for the consonant sounds with the most chars first
- If no consonant sound, then just add 'ay' to the end
- If there's a consonant sound, then delete those chars
  from the start of the word, add them back to the end,
  then add 'ay'

=end

# class PigLatin
#   CONSONANT_SOUNDS = %w() +
#   %w(sch scr shr sph spl spr squ str thr) +
#   %w(bl br ch cl cr dr fl fr gl gr pl pr qu) +
#   %w(sc sh sk sl sm sn sp st sw th tr tw wh wr) +
#   %w(b c d f g h j k l m n p q r s t v w x y z)
  
#   def self.translate(phrase)
#     phrase.split.map { |word| translate_word(word) }.join(' ')
#   end
  
#   def self.translate_word(word)
#     consonant_in_word = ''

#     CONSONANT_SOUNDS.each do |consonant_sound|
#       if word.match(/\A#{consonant_sound}/)
#         consonant_in_word = consonant_sound
#         break
#       end
#     end
    
#     if consonant_in_word.empty?
#       word + 'ay'
#     elsif consonant_in_word == 'x' && word[1] == 'r'
#       word + 'ay'
#     elsif consonant_in_word == 'y' && word[1] == 't'
#       word + 'ay'
#     else
#       word[consonant_in_word.length..-1] + consonant_in_word + 'ay'
#     end    
#   end
# end

=begin

- Check if a word begins with a vowel;
  - If yes, just add 'ay'
- Check the start of the word for contiguous non-vowel chars
  - Delete it from the start of the word, add it back to the end,
    then add 'ay'
- Handle 'x' and 'y' cases
- Handle 'qu' case
=end

# class PigLatin
#   def self.translate(phrase)
#     phrase.split.map { |word| translate_word(word) }.join(' ')
#   end
  
#   def self.translate_word(word)
#     if begins_with_vowel?(word)
#       word + 'ay'
#     else
#       consonant_sound, rest_of_the_word = parse_for_consonant(word)
#       rest_of_the_word + consonant_sound + 'ay'
#     end
#   end
  
#   def self.begins_with_vowel?(word)
#     word.match?(/\A([aeiou]|[xy][^aeiou])/)
#   end
  
#   def self.parse_for_consonant(word)
#     matchdata = word.match(/\A([^aeiou]*qu|[^aeiou]+)(.*)\z/)
#     [matchdata[1], matchdata[2]]
#   end
# end

class PigLatin
  def self.translate(phrase)
    phrase.split.each do |word|
      unless word =~ /\A([aeiou]|[xy][^aeiou])/
        consonant = word.slice!(/\A[^aeiouq]*(qu)?/)
        word << consonant
      end
      
      word << 'ay'
    end.join(' ')
  end
end