=begin

***Did not watch solution video***

Input:
- String
- words delimited by any non-alphanumeric chars, EXCEPT for
  apostrophes

Output:
- Hash
- Keys are word Strings
- Values are Integer counts of number of times
  the word in the keys appears in the input String

Examples / edge cases / extra assumptions:
- Should not mutate the original input String
- Should ignore punctuation
- Case INsensitive; downcase all chars
- Should strip starting and ending apostrophes
  after splitting phrase

Algorithm:
- Downcase input String
- Split it by chars that are not alphanumeric or
  single quotes
- Initialize Hash
- Iterate through words
  - Remove starting and ending apostrophes
  - If key exists, increment by 1
  - Else, create key and increment by 1
- Return Hash

=end

class Phrase
  def initialize(text)
    @text = text
  end
  
  # def word_count
  #   words = text.downcase.split(/[^'[:alnum:]]+/)
  #   words.each_with_object({}) do |word, results|
  #     word = word[1..-2] if word[0] == "'" && word[-1] == "'"
      
  #     results.has_key?(word) ? results[word] += 1 : results[word] = 1
  #   end
  # end
  
  # def word_count
  #   words = text.downcase.split(/[^'[:alnum:]]+/)
  #   words.each_with_object(Hash.new(0)) do |word, results|
  #     word = word[1..-2] if word[0] == "'" && word[-1] == "'"
      
  #     results[word] += 1
  #   end
  # end
  
  # def word_count
  #   words = text.downcase.scan(/\w+'?\w+|\w+/)
    
  #   words.each_with_object(Hash.new(0)) do |word, results|
  #     results[word] += 1
  #   end
  # end

  # def word_count
  #   words = text.downcase.scan(/\b[\w']+\b/)
    
  #   words.each_with_object(Hash.new(0)) do |word, results|
  #     results[word] += 1
  #   end
  # end
  
  # Further exploration
  def word_count
    words = text.downcase.scan(/'?\w+'?\w+'?|\w+/)
    
    words.each_with_object(Hash.new(0)) do |word, results|
      word = word[1..-2] if word[0] == "'" && word[-1] == "'"
      
      results[word] += 1
    end
  end
  
  private
  
  attr_reader :text
end
