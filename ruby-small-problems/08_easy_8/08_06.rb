def fizzbuzz(num1, num2)
  num1.upto(num2) do |i|
    if i % 15 == 0
      print 'FizzBuzz'
    elsif i % 3 == 0
      print 'Fizz'
    elsif i % 5 == 0
      print 'Buzz'
    else
      print i
    end
    print ', ' unless i == num2
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
