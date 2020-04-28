# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
* Both procs and lambdas are `Proc` objects. There're no
  such things are `Block` or `Lambda` classes, or a `Block`
  object
* Both are types of closures - chunks of code that can be
  passed around in a program
* Both are defined using a block, which is not an object in
  itself, but just a type of closure, or a grouping of code
* It appears that procs have lenient arity rules i.e.
  the number of arguments passed in can be more than,
  equal to or fewer than the number of specified
  block parameters
* If we pass in fewer arguments than the number of
  specified block parameters into a block, then all
  extra block parameters will be set to `nil`
* However, if a method explicitly yields to a block, then
  the a block must be passed in to the method; otherwise,
  a `LocalJumpError` will be raised
* Blocks do not have access to local variables within
  method definitions; for a variable to be referenced
  by a block, it must be passed in as an argument to
  the block, or in scope in the main program when the
  block is called
* Blocks will throw a `ArgumentError` if we try to
  reference a variable that's neither in scope nor defined
  as a block parameter
* On the other hand, lambdas have strict arity rules
  i.e. the number of passed-in arguments to a lambda
  must be the same as the number of specified lambda
  parameters
=end
