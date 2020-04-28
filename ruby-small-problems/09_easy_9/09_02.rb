def double?(num)
  num_length = num.to_s.length
  num_length.even? && (num.to_s[0..(num_length/2 - 1)] == num.to_s[num_length/2..-1])
end

def twice(num)
  double?(num) ? num : num*2
end

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
