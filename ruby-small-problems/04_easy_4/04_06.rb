def running_total(array)
  total = 0
  array.map { |num| total += num }
end

def running_total(array)
  array.each_with_object([]) do |num, obj|
    if obj.empty?
      obj << num
    else
      obj << obj.last + num
    end
  end
end

def running_total(array)
  final_array = []
  array.reduce(0) do |accum, num|
    partial_sum = accum + num
    final_array << partial_sum
    partial_sum
  end
  final_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
