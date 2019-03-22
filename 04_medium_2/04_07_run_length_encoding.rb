# Did not watch solution video

class RunLengthEncoding
  
=begin

Input
- String
- Assume won't get number Strings in pre-encoded input

Output
- String
- Consecutive runs 'www' => '3w'
- Single-char run preserved e.g. 'w' => 'w'

Examples / edge cases / assumptions
- Assume always non-empty String. Won't validate or raise exception
- Lossless - decoded output EXACTLY same as pre-encoded input
- So case matters, and all other chars e.g. blanks should be preserved

Algorithm:
- Iterate through input String e.g. 'AABBBCCCC'
  - 1st 'A': save in cache, increment count
  - 2nd 'A': increment count
  - 1st 'B': concat '2A', save 'B' in cache, reset and increment count
  - 2nd 'B': increment count
  - 3rd 'B': increment count
  - 1st 'C': concat '3B', save 'C' in cache, reset and increment count

  - For each char, check if it's the same as previous char
    - If same as previous char, increment cached count
    - If new char,
      - Concat cached count to_s if >= 2
      - Concat cached char if non-empty
      - Clear cache
      - Cache char
      - Increment cached count
  - After loop, to handle last char
    - Concat cached count to_s if >= 2
    - Concat cached char

=end

  # def self.encode(input)
  #   cached_char = ''
  #   cached_count = 0
  #   output = ''
    
  #   input.each_char do |char|
  #     if char == cached_char
  #       cached_count += 1
  #     else
  #       output << cached_count.to_s if cached_count >= 2
  #       output << cached_char unless cached_char.empty?
  #       cached_char = char
  #       cached_count = 1
  #     end
  #   end
    
  #   output << cached_count.to_s if cached_count >= 2
  #   output << cached_char
    
  #   output
  # end

  def self.encode(input)
    input.gsub(/([^0-9])\1+/) { |chars| chars.length.to_s + chars[0] }
  end

=begin

Input
- String

Output
- String

Algorithm
- Initialize empty output String
- Split String into num_strs and chars e.g. ["12", "W", "B", "12", "W", "3", "B", "24", "W", "B"]
- Iterate through Array
  - If num_str, next
  - If char
    - If previous element is num_str, concat num_str.to_i copies of char to output
    - Else, concat char to output
- Return output
=end

  # def self.decode(input)
  #   output = ''
    
  #   num_str_and_chars = input.scan(/[0-9]+|[^0-9]/)
  #   num_str_and_chars.each_with_index do |element, idx|
  #     case element
  #     when /[0-9]+/
  #       next
  #     else
  #       previous_element = num_str_and_chars[idx - 1]
  #       if previous_element =~ /[0-9]+/
  #         output << element * previous_element.to_i
  #       else
  #         output << element
  #       end
  #     end
  #   end
    
  #   output
  # end
  
  def self.decode(input)
    input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end
end
