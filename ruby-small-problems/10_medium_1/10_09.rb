def fibonacci(n)
  arr = [1, 1]
  (n-2).times do
    arr << arr[-1] + arr[-2]
    arr.shift
  end
  arr[-1]
end

def fibonacci(n)
  arr = [1, 1]
  3.upto(n) { arr[0], arr[1] = arr[1], arr[0] + arr[1] }
  arr[1]
end

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501
