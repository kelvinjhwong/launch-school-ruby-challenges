# Calculate position of middle line in lines 0..n: middle_line = n/2
# Do n times:
#   For each line from 0 to n-1
#   Calcualte distance d from middle line
#     If d > 0, (('*' + ' '*(d - 1))*3).rstrip.center(n)
#     If d == 0, puts '*'*n

def distance_from_middle_line(num_lines, line_number)
  (num_lines / 2 - line_number).abs
end

def star(n)
  n.times do |i|
    distance_from_middle_line = ((n / 2) - i).abs
    case distance_from_middle_line
    when 0
      puts '*' * n
    else
      puts (('*' + ' '*(distance_from_middle_line - 1))*3).rstrip.center(n)
    end
  end
end

star(7)

star(9)
