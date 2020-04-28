=begin

***Did not watch solution video***

Input
- String - word
- Array of Strings - words, some of which may be anagrams of the input worwd

Output
- Array of all words from input Array, that are anagrams of the input word

Examples
- Exact 1-1 match in chars; duplicates/subsets of the same char fails the test
- Identical word ISN'T anagram
- Can't just use ASCII numbers
- Case INsensitive

Edge cases / additional assumptions
- No anagrams => return empty Array
- 1 or more anagrams => return Array of all anagrams
- Won't get empty strings or non-String objects

Algorithm / data structure
- Call select to iterate through Array of candidates
  - Compare each candidate with the word, after calling downcase, chars and sort
  - Return false if candidate identical to the word after downcasing
=end

class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(candidates)
    candidates.select do |candidate|
      word.downcase.chars.sort == candidate.downcase.chars.sort &&
        word.downcase != candidate.downcase
    end
  end
  
  private
  
  attr_reader :word
end
