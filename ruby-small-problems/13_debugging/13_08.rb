=begin
**Line 6**

* This line's intention is to re-assign the local variable
  `password` initialized on line 1 to the new String object
  inputted by the user.
* However, this doesn't happen, since methods create their own
  scope.
* So the `password` variable on line 6 has scope that's only
  within the definition of the `set_password` method, and not outside.
  It's in fact a different local variable to `password` on line 1
* Therefore, when this method is invoked, it does not change
  the value of the outer `password` local variable, whose value
  will remain `nil`.
* The new password that has been set by the user will be returned
  by the method invocation, and must be saved as the value of
  a local variable if it's to be used again later in the progrma

**Line 14**

* For a similar reason, this line also doesn't execute as intended
* The expression `input == password` will throw a no method or
  argument error, since at this point, we only have an outer
  `password` local variable, which is not defined for within
  the method definition.

In order to access the outer `password' local variable, we must
first include a parameter for it in both method definitions,
then pass it in to the methods when they're invoked.

=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)