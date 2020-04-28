def interleave(arr1, arr2)
  result_arr = arr1.dup
  arr2.each_with_index do |element, index|
    result_arr.insert((2*index + 1), element)
  end
  result_arr
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
