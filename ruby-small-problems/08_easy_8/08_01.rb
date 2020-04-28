def sum_of_sums(arr)
  sum = 0
  arr.size.times { |idx| sum += arr[0..idx].sum }
  sum
end

def sum_of_sums(arr)
  sum = 0
  arr.map { |num| sum += num }.reduce(0, :+)
end

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
