def drop_while(array)
  array.each_with_object(array.clone) do |item, obj|
    yield(item) ? obj.shift : (return obj)
  end
end

def drop_while(array)
  idx = 0
  
  while yield(array[idx]) && idx < array.size
    idx += 1
  end
  
  array[idx..-1]
end

def drop_while(arr)
  arr.each_with_index { |item, idx| return arr[idx..-1] unless yield(item) }
  []
end

drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []
