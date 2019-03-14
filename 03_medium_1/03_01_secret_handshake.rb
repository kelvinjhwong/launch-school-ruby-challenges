=begin
Input:
- Input or String
- Decimal number

Output:
- Array of Strings
- Each String is a command

Examples / edge cases / assumptions:
- 0, '0', any non-Integer numbers of Strings all return empty Array
- Assume won't get any negative numbers
- Assume won't get empty input e.g. empty String

Algorithm:
- Build lookup Array for operations
- Call to_i to coerce input into into Integer
- Divide by 16 to determine whether operations should be reversed;
  - If yes, reverse lookup
- Work with remainder after dividing to 16
- Convert to binary Integer
- Split into Array of digits, with zeroth place digit at the start
- Map Array to commands

=end

class SecretHandshake
  def initialize(num)
    @num = num
  end
  
  def commands # Returns an Array of commands
    case num
    when Integer
      quotient, remainder = num.divmod(16)
      reverse_events = quotient.odd?

      num_bin = to_binary(remainder)
    when String
      chars = num.chars
      
      return [] if chars.any? { |char| char =~ /[^01]/ }
      
      relevant_digits = chars.last(5).join
      
      case relevant_digits.size
      when 5
        reverse_events = true if relevant_digits[0] == '1'
        num_bin = relevant_digits[1..-1].to_i
      else
        reverse_events = false
        num_bin = relevant_digits.to_i
      end
    end
    
    handshake = num_bin.digits.map.with_index do |digit, idx|
      EVENTS[idx] if digit == 1
    end.reject(&:nil?)
    
    reverse_events ? handshake.reverse : handshake
  end
  
  private
  
  EVENTS = ['wink', 'double blink', 'close your eyes', 'jump']
  
  attr_reader :num
  
  # - 8s: num / 8
  # - 4s: num % 8 / 4
  # - 2s: num % 4 / 2
  # - 1s: num % 2
  
  # 5 % 2 == 1 => last digit 1
  # 5 % 4 / 2 == 0 => next digit 0
  # 5 % 8 / 4 == 1
  
  def to_binary(num)
    num_bin = ''
    current_power_of_2 = 1
    
    loop do
      num_bin.prepend ((num % (current_power_of_2 * 2)) / current_power_of_2).to_s
      
      break if num < current_power_of_2 * 2
      current_power_of_2 *= 2
    end
    
    num_bin.to_i
  end
end
