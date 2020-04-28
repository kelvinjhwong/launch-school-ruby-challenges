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

def max_rotation(num)
  num.to_s.length.downto(2).reduce(num) do |rotated_num, n|
    rotate_rightmost_digits(rotated_num, n)
  end
end

# Recursive version
def max_rotation_str(num_str)
  rotated_num_str = ''
  if num_str.length <= 2
    rotated_num_str << num_str.reverse
  else
    rotated_num_str << num_str[1] + max_rotation_str(num_str[2..-1] + num_str[0])
  end
end

def max_rotation(num)
  max_rotation_str(num.to_s).to_i
end

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845


 735291
3 52917
32 9175
321 759
3215 97
32157 9

 8703529146
7 035291468
73 52914680
732 9146805
7321 468059
73216 80594
732160 5948
7321609 485
73216098 54
732160984 5
