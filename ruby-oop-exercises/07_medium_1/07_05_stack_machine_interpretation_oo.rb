class Operation
  attr_reader :command
  
  def initialize(token)
    @command = case token
               when 'ADD' then :+
               when 'SUB' then :-
               when 'MULT' then :*
               when 'DIV' then :/
               when 'MOD' then :%
               else token
               end
  end
end

class Minilang
  def initialize(tokens)
    @tokens = tokens.upcase.split
  end
  
  def eval
    stack = []
    register = 0

    command = nil
    begin
      tokens.each do |token|
        command = Operation.new(token).command
        
        case command
        when /[[:digit:]]+/ then register = token.to_i
        when 'PUSH' then stack.push(register)
        when 'POP'
          return puts('Empty stack!') if stack.empty?
          register = stack.pop
        when 'PRINT' then puts register
        else 
          return puts('Empty stack!') if stack.empty?
          register = register.send(command, stack.pop)
        end
      end
    rescue NoMethodError
      puts("Invalid token: #{command}")
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
