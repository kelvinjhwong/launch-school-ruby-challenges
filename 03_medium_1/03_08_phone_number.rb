=begin

***Did not watch solution video***

- Assume won't need to validate other types of objects e.g. non-Strings
- Assume to return '0' * 10 for all invalid Strings e.g. empty

Rules:
- Returns a num_str with 10 digits only, or '0' * 10 if invalid num_str
- Invalid when:
   - Contains non-digit chars
   - < 10 digits
   - > 11 digits
   - 11 digits with 1st digit NOT '1'
- If 11 digit with 1st digit '1', return the last 10 digits only
    
Algorithm:
- Detect non-digit, non-punctuation, chars; if present, invalid String, return
  '0' * 10
- Else, extract digits only
- If length == 10, return
- Else if length == 11 && first char is 1, return last 10 digits
- Else invalid String

=end

class PhoneNumber
  def initialize(num_str)
    @num_str = num_str
  end
  
  def number

    return INVALID_NUM_PLACEHOLDER if num_str =~ /[^0-9.\- ()]/
    
    digit_str = num_str.delete('^0-9')
    num_of_digits = digit_str.length
    
    if num_of_digits == 10
      digit_str
    elsif num_of_digits == 11 && digit_str[0] == '1'
      digit_str[1..-1]
    else
      INVALID_NUM_PLACEHOLDER
    end
  end
  
  def area_code
    # Assume valid number
    number[0..2]
  end
  
  def to_s
    # Assume valid number
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
  
  private
  
  INVALID_NUM_PLACEHOLDER = '0' * 10
  
  attr_reader :num_str
end