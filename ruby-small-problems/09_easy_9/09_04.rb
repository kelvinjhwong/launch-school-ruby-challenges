def sequence(num)
  num.positive? ? (1..num).to_a : (num..-1).to_a
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

sequence(-5)
sequence(-3)
sequence(-1)
