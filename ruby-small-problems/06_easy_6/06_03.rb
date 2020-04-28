# Write method to compute the ith Fibonacci number, i = 1, 2, ...
# Main method should compute each Fib num, check its length;
# if less than n, move on to the next Fib num

def fibonacci_number(i)
  if i == 1 || i == 2
    1
  else
    fibonacci_number(i - 1) + fibonacci_number(i - 2)
  end
end

def find_fibonacci_index_by_length(n)
  fibonacci_numbers = [1, 1]
  while fibonacci_numbers.last.to_s.length < n
    fibonacci_numbers << fibonacci_numbers[-1] + fibonacci_numbers[-2]
  end
  fibonacci_numbers.size
end

# Official solution
def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
