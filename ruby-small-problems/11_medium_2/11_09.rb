# Loop
# Initiate swap_count to 0
# Iterate through every element using each_with_index
# Compare element with the next element using <=>
# If 1, then swap using double assignment, increment swap_count
# Else do nothing
# Break if swap_count == 0

def bubble_sort!(arr)
  loop do
    swapped = false
    last_element_to_compare_index = arr.size - 2

    0.upto(last_element_to_compare_index) do |idx|
      if (arr[idx] <=> arr[idx + 1]) == 1
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swapped = true
      end
    end

    break unless swapped

    last_element_to_compare_index -= 1
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
