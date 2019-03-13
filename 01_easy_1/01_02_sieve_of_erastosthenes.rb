=begin

***Did not watch solution video***

Input
- Integer

Output
- Array of prime numbers from 2, up to input Integer,
  in order

Examples/edge cases
- Assume input Integer >= 2

Assumptions
- 

Algorithm/data structure
- Start with Array `nums` of all Integers from 2 to input Integer
- Iterate from 2; for each Integer
  - Remove all its multiples from `nums`, mutating nums itself
  - Break iteration when we reach the end of `nums`
- Return `nums`

=end

class Sieve
  attr_reader :limit
  
  def initialize(limit)
    @limit = limit
  end
  
  def primes
    nums = (2..limit).to_a
    # counter = 0
    
    # loop do
    #   current_num = nums[counter]
    #   nums.reject! { |num| num % current_num == 0 && num > current_num }
      
    #   counter += 1
    #   break if counter >= nums.size
    # end
    
    nums.each do |prime|
      nums.reject! { |num| num % prime == 0 && num > prime }
    end
  end
end
