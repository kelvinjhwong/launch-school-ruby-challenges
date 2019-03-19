=begin

***Did not watch solution video***

Input:
- Integer number of rows

Output:
- Nested Array
- All the rows of Pascal's triangle with that number of rows

Examples / edge cases / assumptions:
- Positive Integer

Algorithm:
- Start with [1]
- Iterate (number_of_rows - 1) times
  - Each time, take the last element of the rows nested Array e.g. [1]
  - Create new temp Array with 0s on either end e.g. [0, 1, 0]
  - Iterate through each consecutive pair of elements, pushing their sum
    to the current row [1, 1]
- Return the rows Array

=end

class Triangle
  def initialize(num_of_rows)
    @num_of_rows = num_of_rows
  end
  
  def rows
    rows = [[1]]
    
    (num_of_rows - 1).times do
      last_row_with_zeros = [0] + rows.last + [0]
      
      new_row = last_row_with_zeros.each_cons(2).with_object([]) do |(num1, num2), row|
        row << num1 + num2
      end
      
      rows << new_row
    end
    
    rows
  end
  
  private
  
  attr_reader :num_of_rows
end
