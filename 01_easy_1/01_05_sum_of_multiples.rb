=begin

Input:
- Integer ceiling
- Collection of Integer factors (optional)
- If no factors given, factors assumed to be 3 and 5

Output
- Integer
- Sum of all multiples of Integer factors,
  up to but NOT including ceiling

Examples / edge cases / assumptions
- ceiling smaller than smallest factor? Assumed to return 0

Algorithm
- Initialize empty `multiples` array
- Iterate through all factors; for each factor
  - Push all multiples of that factor to `multiples`, up to ceiling
- Return sum of `multiples`'s #uniq elements

***Did not watch solution video***

=end

class SumOfMultiples
  attr_reader :nums
  
  def initialize(*nums)
    @nums = nums
  end
  
  def self.to(limit)
    self.new.sum_multiples([3, 5], limit)
  end
  
  def to(limit)
    sum_multiples(nums, limit)
  end
  
  def sum_multiples(factors, limit)
    # multiples = []
    
    # factors.each do |factor|
    #   factor.step(by: factor, to: (limit - 1)) do |multiple|
    #     multiples << multiple
    #   end
    # end
    
    # multiples.uniq.sum
    
    (1...limit).select do |num|
      factors.any? { |factor| num % factor == 0 }
    end.sum
  end
end
