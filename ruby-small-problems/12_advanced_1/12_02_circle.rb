# Given r, construct imaginary grid that's 2r + 1 high, and 4r + 1 wide
# For each point in the grid
#   Calculate whether it's within the circle, using the equation for a circle
#   If yes, print '* '
#   Can stop execution for a row, as soon as x > r, and we hit no for a point

# print_row(radius, line_num_from_middle) method
# Given radius == r, line_num == i
#   Look for smallest x such that (r-x)^2 + i^2 <= r^2
#   i.e. x >= r - (r^2 - i^2)^0.5
#   boundary_x_coord = (r - (r^2 - i^2)^0.5).ceil
#   puts '  ' * (x - 1) + '* '*(r - x) + '*' + '* ' * (r - x)

def print_row(radius, line_num_from_middle)
  r, i = radius.to_f, line_num_from_middle.to_f
  boundary_x_coord = (r - (r**2 - i**2)**0.5).ceil
  x = boundary_x_coord
  puts '  '*(x - 1) + '* '*(r - x) + '*' + ' *'*(r - x)
end

def circle(radius)
  radius.downto(1) { |i| print_row(radius, i) }
  print_row(radius, 1)
  1.upto(radius) { |i| print_row(radius, i) }
end
