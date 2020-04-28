def oddities(array)
  result = []
  array.each_with_index { |element, index| result << element if index.even? }
  result
end

def oddities2(array)
  result = []
  0.step(array.size-1, 2) { |i| result << array[i] }
  result
end

def oddities3(array)
  result = []
  array.size.times { |i| result << array[i] if i.even?}
  result
end

def oddities4(array)
  result = []
  array.each { |obj| result << obj if array.index(obj).even? }
  result
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []

puts oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities3(['abc', 'def']) == ['abc']
puts oddities3([123]) == [123]
puts oddities3([]) == []

puts oddities4([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities4([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities4(['abc', 'def']) == ['abc']
puts oddities4([123]) == [123]
puts oddities4([]) == []
