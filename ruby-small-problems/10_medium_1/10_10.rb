def fibonacci_last(n)
  arr = [1, 1]
  3.upto(n) { arr[0], arr[1] = arr[1], (arr[0] + arr[1]) % 10 }
  arr[1]
end

def fibonacci_last(n)
  n = n % 60
  arr = [1, 1]
  3.upto(n) { arr[0], arr[1] = arr[1], (arr[0] + arr[1]) % 10 }
  arr[1]
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
fibonacci_last(123_456_789_987_745) # -> 5

# Fibonacci sequence last digits
# 1 1 2 3 5 8 3 1 4 5 
# 9 4 3 7 0 7 7 4 1 5 
# 6 1 7 8 5 3 8 1 9 0 
# 9 9 8 7 5 2 7 9 6 5 
# 1 6 7 3 0 3 3 6 9 5 
# 4 9 3 2 5 7 2 9 1 0 
# 1 1 2
