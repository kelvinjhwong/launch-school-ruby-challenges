=begin

***Did not watch solution video***

Algorithm:
- Use Sieve of Erastosthenes to weed out non-primes

- Initialize empty `primes` Array
- Initialize counter to 0
- Iterate from 2 up
  - If current_num is a multiple of any of the primes, next
  - Else
    - add to `primes` Array
    - increment counter
  - Break when counter == n

=end

class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0
    
    current_num = 3
    primes = [2]
    counter = 1
    
    while counter < n do
      current_num_sqrt = Math.sqrt(current_num)
      
      if primes.any? do |prime|
        break false if prime > current_num_sqrt
        current_num % prime == 0
      end
        current_num += 2
        
        next
      else
        primes << current_num
        
        counter += 1
      end
      
      break if counter == n
      current_num += 2
    end
    
    primes.last
  end
end
