def shout_out_to(name)
  name.upcase!
  
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

=begin
Because #upcase! is called on each element of the newly
created Array object that was the return value of `name.chars`.

After line 2, this newly created Array now has all its elements
mutated by #upcase!, however the object referenced by the
local variable `name` remains unchanged i.e. it's still the
same String object, `'you'`, with the same value, that was
passed in when the method `shout_out_to` was invoked.
=end