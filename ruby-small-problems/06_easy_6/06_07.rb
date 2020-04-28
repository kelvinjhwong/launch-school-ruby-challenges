def halvsies(array)
  if array.length.even?
    [array[0..(array.length/2 - 1)], array[array.length/2..-1]]
  else
    [array[0..(array.length/2)], array[(array.length/2 + 1)..-1]]
  end
end

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
