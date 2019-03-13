=begin

***Did not watch solution video***

Input
- Integer
- Positive

Output
- String
- 'deficient', 'perfect' or 'abundant'

Examples / edge cases / extra assumptions
- Raise RuntimeError if negative, or 0
- Won't validate input - assume it's a positive Integer
- How about 1? Assume won't get this

Algorithm
- Sum all factors >= 1, less than input Integer
  - Iterate from 1 up to, but not including, sqrt of input Integer
    - If it divides input Integer, then add it + its quotient to sum
  - If input Integer is a perfect square, add its square root to sum
- Return the right String based on sum

=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError, 'Number must be positive!' if num <= 0
    
    square_root = num**0.5
    
    factors_sum = (2...square_root).reduce(1) do |sum, div|
      num % div == 0 ? sum + div + num / div : sum
    end
    
    factors_sum += square_root if square_root.is_a? Integer
    
    case factors_sum <=> num
    when 1  then 'abundant'
    when 0  then 'perfect'
    when -1 then 'deficient'
    end
  end
end
