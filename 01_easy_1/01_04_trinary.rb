# Did not watch solution video

class Trinary
  attr_reader :trinary_str
  
  def initialize(num_str)
    @trinary_str = num_str.to_i.to_s
  end
  
  def to_decimal
    trinary_digits = trinary_str.chars.map(&:to_i)
    
    return 0 if trinary_digits.any? { |digit| digit >= 3 }
    
    # trinary_digits.reverse.each_with_index.reduce(0) do |sum, (digit, idx)|
    #   sum + digit * (3 ** idx)
    # end
    
    trinary_digits.reduce { |sum, digit| sum * 3 + digit }
  end
end
