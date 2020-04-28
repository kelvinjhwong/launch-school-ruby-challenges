def zip(arr1, arr2)
  (0...arr1.size).map { |idx| [arr1[idx], arr2[idx]] }
end

zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
