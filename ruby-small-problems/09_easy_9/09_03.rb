def negative(num)
  num.positive? ? -num : num
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0