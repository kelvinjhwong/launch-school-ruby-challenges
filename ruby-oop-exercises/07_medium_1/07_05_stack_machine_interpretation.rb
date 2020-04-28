class Minilang
  def initialize(tokens)
    @tokens = tokens.upcase.split
  end
  
  def eval
    stack = []
    register = 0
    
  
    tokens.each do |token|
      case token
      when /[[:digit:]]+/ then register = token.to_i
      when 'PUSH' then stack.push(register)
      when 'ADD'
        return puts('Empty stack!') if stack.empty?
        register += stack.pop
      when 'SUB'
        return puts('Empty stack!') if stack.empty?
        register -= stack.pop
      when 'MULT'
        return puts('Empty stack!') if stack.empty?
        register *= stack.pop
      when 'DIV'
        return puts('Empty stack!') if stack.empty?
        register /= stack.pop
      when 'MOD'
        return puts('Empty stack!') if stack.empty?
        register %= stack.pop
      when 'POP'
        return puts('Empty stack!') if stack.empty?
        register = stack.pop
      when 'PRINT' then puts register
      else return puts("Invalid token: #{token}")
      end
    end
  end
  
  private
  
  attr_reader :tokens
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
