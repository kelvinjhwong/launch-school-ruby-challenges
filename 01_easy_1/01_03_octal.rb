=begin

***Did not watch solution video***

Input:
- String
- Octal

Output:
- Integer
- Decimal

Edge cases:
- Invalid input is Octal 0
- Ignore leading '0' chars

Algorithm:
- Convert input String to Integer representation of octal
  number by calling #to_i (turns invalid input to 0)
- Convert back to String, split into chars e.g. ['2', '3', '3']
- Iterate in reverse with index, each time multiplying by 8**(2 - idx)
- Reduce to sum

=end

class Octal
  attr_reader :octal
  
  def initialize(str)
    @octal = str.to_i # Converts all non-numeric Strings to 0
  end
  
  def to_decimal
    octal_digits = octal.to_s.chars.map(&:to_i)
    
    return 0 if octal_digits.any? { |digit| digit >= 8 }
    
    octal_digits.reverse.each_with_index.reduce(0) do |sum, (digit, idx)|
      sum + digit*(8**idx)
    end
  end
end
