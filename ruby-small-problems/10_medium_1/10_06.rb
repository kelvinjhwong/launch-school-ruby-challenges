# - Write separate method for each command, within
#   main minilang method; each method should take
#   both the register and stack values as arguments.
# - Initialize register to 0, and stack to empty array
# - Parse command by splitting string and
#   storing each command in array, then using a case statement

def minilang(program)
  register = 0
  stack = []
  program.split.each_with_object(nil) do |token, _|
    case token
    when /[0-9]/ then register = token.to_i
    when 'PUSH' then stack.push(register)
    when 'ADD'
      stack.empty? ? (return('Stack is empty!')) : register += stack.pop
    when 'SUB'
      stack.empty? ? (return('Stack is empty!')) : register -= stack.pop
    when 'MULT'
      stack.empty? ? (return('Stack is empty!')) : register *= stack.pop
    when 'DIV'
      stack.empty? ? (return('Stack is empty!')) : register /= stack.pop
    when 'MOD'
      stack.empty? ? (return('Stack is empty!')) : register %= stack.pop
    when 'POP'
      stack.empty? ? (return('Stack is empty!')) : register = stack.pop
    when 'PRINT' then puts register
    else
      return 'Invalid token!'
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')
# 8
