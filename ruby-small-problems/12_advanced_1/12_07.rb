=begin
- Start with two counter variables idx1 and idx2,
  both initalized to 0, one for each input array
- Compare arr1[idx1] with arr2[idx2]
  - If arr1[idx1] > arr2[idx2]
    - Append new sorted_array with arr1[idx1]
    - Increment idx1
  - Elsif swap 1 and 2
  - Else (i.e. they're equal)
    - Append both arr1[idx1] and arr2[idx2]
    - Increment both index variables
- Repeat until idx1 >= arr1.size - 1, same with idx2
=end

def merge(arr1, arr2)
  if arr1.empty?
    return arr2
  elsif arr2.empty?
    return arr1
  end
  
  idx1, idx2 = 0, 0
  sorted_arr = []
  loop do
    if arr1[idx1] >= arr2[idx2]
      sorted_arr << arr2[idx2]
      idx2 += 1
    elsif
      sorted_arr << arr1[idx1]
      idx1 += 1
    end
    
    if idx1 >= arr1.size
      sorted_arr.concat(arr2[idx2..-1])
      return sorted_arr
    elsif idx2 >= arr2.size
      sorted_arr.concat(arr1[idx1..-1])
      return sorted_arr
    end
  end
end

def merge(arr1, arr2)
  idx2 = 0
  merged_arr = []
  arr1.each do |element|
    while idx2 < arr2.size && arr2[idx2] < element
      merged_arr << arr2[idx2]
      idx2 += 1
    end
    merged_arr << element
  end
  merged_arr.concat(arr2[idx2..-1]) if idx2 < arr2.size
  merged_arr
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]
