=begin

Input:
- String
- 1+ words, delimited by 1+ spaces, terminated by 0+ spaces
  and a point

Output:
- New String object
- Same words, separated by 1 space only
- Last word terminated by a point
- Odd words are reversed

Examples / edge cases / assumptions:
- Chars - letters, space, point only
- Wors - 1-20 letters
- Word > 20 letters?
- Empty String?
- Case? Preserve
- Punctuation? Won't get

Algorithm:
- Remove the point - delete last char
- Split input String into words
- Iterate through Array of words
  - If odd index, then reverse the word
- Join the words with a space in between
- Add back the point

=end

def reverse_odd_words(sentence)
  sentence_without_point = sentence[0..-2]
  
  words = sentence_without_point.split
  1.step(by:2, to: words.size - 1) { |idx| words[idx].reverse! }
  words.join(' ') + '.'
  
  # sentence[0..-2].split.each_with_index do |word, idx|
  #   word.reverse! if idx.odd?
  # end.join(' ') + '.'
end

=begin

Algorithm:
- Set 'in_space' flag to false
- Initialize reversed word to empty String
- Initialize 'odd' flag to false
- Iterate through all chars
  - If char is letter
    - If in_space is true
      - Print space
    
    - Set in_space to false
    
    - If even
      - Print char
    - Else if odd
      - Prepend reversed word with char

  - Else if char is space

    - If in_space is false   # first space
      - Set in_space to true
      
      - If odd is true
        - print reversed_word
        - re-initialize reversed_word to ''
      
      - Toggle 'odd' flag

  - Else if char is point
    - If odd is true
      - print reversed_word
    
    - Print char

More high-level algorithm-planning:
Example: 'whats   the matter  with kansas  today .'
- Iterate through each char
  / If in an even word e.g. 'whats', print every char
  / If in a space, toggle flag to save this state, but DON'T print the space
    yet. Shouldn't print any spaces until the first non-space char
    / Should also toggle odd/even
  / If in the first char of a word after a space e.g. 't' in 'the',
    print one space char
  / If in an odd word e.g. 'the', save every char into cache, then print
    at the space or point after it
    / So if in a space + after odd word, also need to print the cache,
      e.g. 'eht', then clear the cache
    / And if get to the point, if it's after an even word, just print the
      point; otherwise, print the reversed odd word before it, then print
      the point

- Re-organise:
  - Initialize cached String
  - Initialize odd/even flag
  - Initialize in_spaces flag
  
  - If in word i.e. char is a letter
    - If first char after spaces
      - Print a space
      - Toggle in_spaces flat

    - If even, print the char
    - Else if odd, prepend char to cached String
  
  - If in space
    - If the first space
      - If after odd word
        - Print cached String
        - Clear cache
      
      - Toggle in_spaces flag to true ONCE
      - Toggle odd/even flag ONCE

  - If a point
    - If after odd word (i.e. odd flag is still true) and after 0 or more spaces
      - Print the cached String
    
    - Print the point

=end

def reverse_odd_words(sentence)
  in_spaces = false
  odd_word = false
  reversed_word = ''
    
  sentence.each_char do |char|
    case char
    when /[a-zA-Z]/
      if in_spaces
        print ' '
        in_spaces = false
      end
      
      odd_word ? reversed_word.prepend(char) : print(char)
    when ' '
      if !in_spaces
        if odd_word
          print reversed_word
          reversed_word = ''
        end
        
        odd_word = odd_word ? false : true
        in_spaces = true
      end
    when '.'
      print reversed_word if !in_spaces && odd_word
      print char
    end
  end
end

# Test cases

reverse_odd_words('this.') == 'this.'
reverse_odd_words('this  .') == 'this.'
reverse_odd_words('this day.') == 'this yad.'
reverse_odd_words('this Town has two drivers .') == 'this nwoT has owt drivers.'
reverse_odd_words('whats   the matter  with kansas  today .') == 'whats eht matter htiw kansas yadot.'
reverse_odd_words('a  b    c   d e  .') == 'a b c d e.'
