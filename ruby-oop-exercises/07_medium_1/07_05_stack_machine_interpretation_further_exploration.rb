class MinilangRuntimeError < RuntimeError; end

class EmptyStackError < MinilangRuntimeError; end

class BadTokenError < MinilangRuntimeError; end

class Minilang
  OPERATIONS = %w(push add sub mult div mod pop print)
  
  def initialize(program)
    @program = program
  end
  
  def eval(parameters)
    @stack = []
    @register = 0

    tokens = format(@program, parameters).downcase.split

    begin
      tokens.each { |token| eval_token(token.downcase) }
    rescue MinilangRuntimeError => error
      puts error.message
    end
  end
  
  private
  
  attr_reader :tokens

  def eval_token(token)
    if token =~ /[[:digit:]]+/
      @register = token.to_i
    elsif OPERATIONS.include? token
      send(token)
    else
      raise BadTokenError.new("Invalid token: #{token}")
    end
  end
  
  def push
    @stack.push(@register)
  end
  
  def add
    raise EmptyStackError.new('Empty stack!') if @stack.empty?
    @register += @stack.pop
  end
  
  def sub
    raise EmptyStackError.new('Empty stack!') if @stack.empty?
    @register -= @stack.pop
  end
  
  def mult
    raise EmptyStackError.new('Empty stack!') if @stack.empty?
    @register *= @stack.pop
  end
  
  def div
    raise EmptyStackError.new('Empty stack!') if @stack.empty?
    @register /= @stack.pop
  end
  
  def mod
    raise EmptyStackError.new('Empty stack!') if @stack.empty?
    @register %= @stack.pop
  end
  
  def pop
    raise EmptyStackError.new('Empty stack!') if @stack.empty?
    @register = @stack.pop
  end
  
  def print
    puts @register
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)

minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

FAHRENHEIT_TO_CENTIGRADE = 
  '9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT'

minilang_fahr_to_cels = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)

minilang_fahr_to_cels.eval(degrees_f: 32)
# 0
minilang_fahr_to_cels.eval(degrees_f: 0)
# -17 / -18
minilang_fahr_to_cels.eval(degrees_f: 104)
# 40

MPH_TO_KMPH = '5 PUSH 8 PUSH %<mph>d MULT DIV PRINT'

minilang_mph_to_kmph = Minilang.new(MPH_TO_KMPH)

minilang_mph_to_kmph.eval(mph: 0)
# 0
minilang_mph_to_kmph.eval(mph: 40)
# 64
minilang_mph_to_kmph.eval(mph: 100)
# 160

RECTANGLE_AREA = '%<side2_length>d PUSH %<side1_length>d MULT PRINT'

minilang_rectangle_area = Minilang.new(RECTANGLE_AREA)

minilang_rectangle_area.eval(side1_length: 3, side2_length: 4)
# 12
minilang_rectangle_area.eval(side1_length: 0, side2_length: 3)
# 0
minilang_rectangle_area.eval(side1_length: 8, side2_length: 3)
# 24