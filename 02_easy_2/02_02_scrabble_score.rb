=begin

Input:
- String or `nil`
- String could contain letters or whitespace chars
- Could be empty

Output:
- Integer
- Sum of the scores for each char in the input String
- Return 0 for `nil` or whitespace chars

Examples / edge cases / assumptions:
- Ignore letter case
- Assume won't get chars other than alpha, whitespace and nil
  - Or just map to 0? Or raise exception?

Algorithm / data structure:
- Downcase String
- Coerce `nil` to ''
- Iterate through input String and reduce
  - For each char, increment accumulator by its score
    - If char isn't letter, increment by 0

- Lookup Hash to store scores for each letter, to avoid searching through
  a collection of letters at each iteration

=end

class Scrabble
  def initialize(word)
    @word = word
  end
  
  def score
    word.to_s.downcase.chars.sum { |char| SCORES[char] }
  end
  
  def self.score(word)
    new(word).score
  end
  
  private
  
  scores = Hash.new(0)
  %w(a e i o u l n r s t).each { |letter| scores[letter] = 1 }
  %w(d g).each { |letter| scores[letter] = 2 }
  %w(b c m p).each { |letter| scores[letter] = 3 }
  %w(f h v m y).each { |letter| scores[letter] = 4 }
  scores['k'] = 5
  %w(j x).each { |letter| scores[letter] = 8 }
  %w(q z).each { |letter| scores[letter] = 10 }
  
  SCORES = scores.clone.freeze
  
  attr_reader :word
end
