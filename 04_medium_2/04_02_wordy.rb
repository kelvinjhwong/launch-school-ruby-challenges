=begin

***Did not watch solution video***

Input:
- String
- Math question
- Numbers or operations in words

Output:
- Integer

Examples / edge cases / assumptions:
- Inconsistent question format e.g. different case, punctuation? Assume won't
  get
  Assume won't get
- Dividing by 0? Assume won't get
- Floats? Assume won't get
- Integer division vs Float division? Assume Integer division
- Invalid question? Raise ArgumentError
- Interrupted question ending with an operation - neglect last operation

Algorith: 
- Split into Array of words
- Delete first 2 elements
- Initialize current_operation variable
  - Iterate through Array, reduce
  - If 'plus', 'minus', 'multiplied' or 'divided'
    - Save operation to current_operation
  - Else if 'by', next
  - Else if digit
    - Convert to Integer
    - Execute operation, update accumulator
  - Else
    - Raise ArgumentError
=end

class WordProblem
  def initialize(question)
    @question = question
  end
  
  # def answer
  #   words = question.split[2..-1]
    
  #   result = words.shift.to_i
  #   current_operator = ''
    
  #   words.each do |word|
  #     case word
  #     when 'plus', 'minus', 'multiplied', 'divided'
  #       current_operator = word
  #     when /\b[0-9]+\??\b/
  #       result = result.send(OPERATORS[current_operator], word.to_i)
  #     when 'by'
  #       next
  #     else
  #       raise ArgumentError
  #     end
  #   end
    
  #   result
  # end
  
  def answer
    raise ArgumentError unless valid_question?
    
    nums_str_and_ops = question.scan(/\-?\d+|plus|minus|multiplied by|divided by/)
    result = nums_str_and_ops.shift.to_i
    
    nums_str_and_ops.each_slice(2) do |op, num_str|
      result = result.send(OPS[op], num_str.to_i)
    end
    
    result
  end
  
  private
  
  # OPERATORS =
  #   { 'plus' => :+, 'minus' => :-, 'multiplied' => :*, 'divided' => :/ }

  OPS =
    { 'plus' => :+, 'minus' => :-, 'multiplied by' => :*, 'divided by' => :/ }
  
  VALID_QUESTION_REGEX =
    /What is \-?\d+(\s+(plus|minus|multiplied by|divided by)\s+\-?\d+)+\?/
  
  attr_reader :question
  
  def valid_question?
    question.match?(VALID_QUESTION_REGEX)
  end
end

# Monkey-patching!
# class Integer
#   alias_method :plus, :+
#   alias_method :minus, :-
#   alias_method :multiplied, :*
#   alias_method :divided, :/
# end
