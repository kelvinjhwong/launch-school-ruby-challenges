def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

=begin
On line 5, the ternary operator evaluates the expression
`odd_count = 3` before the `?`. In this expression, the local
variable is re-assigned to the Integer object with value `3`,
which returns the value of odd_count, i.e. `3`. `3` is a
truthy value, so it will always evaluate to true. Hence the
whole line will always return `true`.

Instead, we should use `odd_count == 3` as the expression
to be evaluated. #== checks whether the local variable
`odd_count`'s value is `3`; if yes, it returns `true`, 
else it returns `false`'.

In fact, we would not need to use the ternary operator at
all; we can simply write the last statement as
`odd_count == 3`
=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end