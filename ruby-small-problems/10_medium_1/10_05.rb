def diamond(n)
  ((n + 1)/2).times { |i| puts ('*'*(2*i + 1)).center(n) }
  (n/2).times { |i| puts ('*'*(n - (i + 1) * 2)).center(n) }
end

def num_stars_on_line_i(height, i)
  i <= height/2 ? 2*i + 1 : (height - i)*2 - 1
end

def diamond(n)
  n.times { |i| puts ('*'*num_stars_on_line_i(n, i)).center(n) }
end

diamond(1)
diamond(3)
diamond(9)

def num_spaces_on_line_i(height, i)
  i <= height/2 ? 2*i - 1 : (height - i)*2 - 3
end

def diamond_outline(n)
  n.times do |i|
    i == 0 || i == n-1 ? puts('*'.center(n)) : puts(('*' + ' '*(num_spaces_on_line_i(n, i)) + '*').center(n))
  end
end

diamond_outline(1)
diamond_outline(3)
diamond_outline(9)
