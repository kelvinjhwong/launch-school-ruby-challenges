=begin

***Did not watch solution video***
- If try again... try using String#ljust and Array#transpose
- Should also refactor to remove duplication in ciphertext and
  normalize_ciphertext

Input:
- String

Output:
- New String object
- Encoded message

Examples / edge cases / assumptions:
- Empty String? Won't get
- Non-Strings objects? Won't get
- Don't need to validate

=end

class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end
  
  def normalize_plaintext
    plaintext.delete('^a-zA-Z0-9').downcase
  end
  
  def size
    # If perfect square, then use sqrt
    # Else, use ceiling of sqrt
    
    Math.sqrt(normalize_plaintext.length).ceil
  end
  
  def plaintext_segments
    # Given normalized plaintext and size, split into Array of segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end
  
  def ciphertext
    # Iterate through Array of Strings
    # - Repeatedly slice! the first char of each String
    # - Add char to output String
    segments = plaintext_segments
    
    size.times.with_object('') do |_, ciphered_text|
      segments.each { |segment| ciphered_text << (segment.slice!(0) || '') }
    end
  end
  
  def normalize_ciphertext
    segments = plaintext_segments
    
    size.times.with_object('') do |_, ciphered_text|
      segments.each { |segment| ciphered_text << (segment.slice!(0) || '') }
      ciphered_text << ' '
    end.rstrip
  end
  
  private
  
  attr_reader :plaintext
end