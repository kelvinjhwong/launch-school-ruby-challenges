=begin

Input:
- String of digits
- Integer

Output
- Array of Arrays
- Each subarray contains all consecutive runs of Integers
  of length equal to the input number, in order

Other requirements
- Create new class of objects with name `Series`
- Method should be instance method with name `slices`,
  taking one parameter
- If input Integer > lenght of input String, then raise
  ArgumentError

******

Edge cases:
- Empty String? nil?

******

Algorithm
- 

=end

class Series
  def initialize(digits)
    @digits = digits
  end
  
  def slices(num)
    raise ArgumentError if num > digits.length
    
    digits.chars.map(&:to_i).each_cons(num).to_a
  end
  
  private
  
  attr_reader :digits
end
