# Did not watch wolution video

class Luhn
  def initialize(num)
    @num = num
  end
  
  def addends
    num.digits.map.with_index do |digit, idx|
      if idx.odd?
        digit_doubled = digit * 2
        digit_doubled > 9 ? digit_doubled - 9 : digit_doubled
      else
        digit
      end
    end.reverse
  end
  
  def checksum
    addends.sum
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(num)
    num_multipled_by_10 = num * 10
    partial_checksum = new(num_multipled_by_10).checksum
    num_multipled_by_10 + (10 - (partial_checksum % 10)) % 10
  end
  
  private
  
  attr_reader :num
end
