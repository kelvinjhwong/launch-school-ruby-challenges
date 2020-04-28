def reverse(array)
  new_array = []
  array.each { |element| new_array.insert(0, element) }
  new_array
end

def reverse(array)
  array.each_with_object([]) { |element, obj| obj.insert(0, element) }
end

def reverse(array)
  array.inject([]) { |result_array, element| result_array.insert(0, element) }
end

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true
