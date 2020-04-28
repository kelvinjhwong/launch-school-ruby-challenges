def sequence(count, start_num)
  1.upto(count).reduce([]) { |arr, multiple| arr << start_num * multiple }
end

def sequence(count, start_num)
  (1..count).map { |multiple| start_num * multiple }
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
