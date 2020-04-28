def rotate_array(arr)
  arr.map.with_index { |_, idx| arr[(idx + 1) % arr.size] }
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_rightmost_digits(num, n)
  num_str = num.to_s
  (num_str[0...-n] + rotate_string(num_str[-n..-1])).to_i
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
