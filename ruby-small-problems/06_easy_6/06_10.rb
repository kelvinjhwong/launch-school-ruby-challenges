def triangle(n)
  (n + 1).times { |i| puts ' '*(n - i) + '*'*i }
end

triangle(5)
triangle(9)

def upside_down_triangle(n)
  (n + 1).times { |i| puts ' '*i + '*'*(n - i) }
end

upside_down_triangle(5)
upside_down_triangle(9)

def right_triangle(n, right_angle_location)
  case right_angle_location
  when 'top left' then (n + 1).times { |i| puts '*'*(n - i)}
  when 'top right' then (n + 1).times { |i| puts ' '*i + '*'*(n - i) }
  when 'bottom left' then (n + 1).times { |i| puts '*'*i }
  when 'bottom right' then (n + 1).times { |i| puts ' '*(n - i) + '*'*i }
  end
end
