def divisors(num)
  (1..num).select { |div| num % div == 0 }
end

def divisors(num) # Faster algorithm
  (1..num**0.5).each_with_object([]) do |div, arr|
    if num % div == 0
      arr << div
      arr << num / div unless num == 0 || num == 1
    end
  end.sort
end

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891]
divisors(999962000357) == [1, 999979, 999983, 999962000357]
