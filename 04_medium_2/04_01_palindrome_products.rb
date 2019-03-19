=begin

***Did not watch solution video***

Input:
- 1 or 2 Integers

Output:
- The largest palindromic product of 2 Integers
  between the two input Integers

Examples / edge cases / assumptions:
- Range includes the start and end Integers
- If only 1 input Integer, then assume minimum is 1
- Assume will only get positive Integers

Algorithm:


=end

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = []
  end
  
  def generate
    (min_factor..max_factor).each do |num1|
      (num1..max_factor).each do |num2|
        product = num1 * num2
        
        if Palindrome.palindrome?(product)
          current_palindrome =
            palindromes.find { |palindrome| palindrome.value == product }
          
          if current_palindrome.nil?
            current_palindrome = Palindrome.new(product)
            palindromes << current_palindrome
          end
          
          current_palindrome.add_factor_pair(num1, num2)
        end
      end
    end
  end
  
  def largest
    palindromes.max
  end
  
  def smallest
    palindromes.min
  end
  
  private
  
  attr_reader :max_factor, :min_factor
  attr_accessor :palindromes
end

class Palindrome
  include Comparable
  
  attr_reader :value
  
  def initialize(value)
    @value = value
    @factor_pairs = []
  end
  
  def add_factor_pair(factor1, factor2)
    factor_pairs << [factor1, factor2]
  end
  
  def factors
    factor_pairs
  end
  
  def self.palindrome?(num)
    num_str = num.to_s
    num_str == num_str.reverse
  end
  
  protected
  
  def <=>(other)
    value <=> other.value
  end
  
  private
  
  attr_accessor :factor_pairs
end
