def step(start_num, end_num, step_size)
  current_num = start_num
  
  while current_num <= end_num
    yield(current_num)
    current_num += step_size
  end
  
  start_num..end_num
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
