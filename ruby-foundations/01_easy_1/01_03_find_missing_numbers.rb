def missing(nums)
  nums.first.upto(nums.last).with_object([]) do |num, arr|
    arr << num unless nums.include? num
  end
end

def missing(nums)
  (nums.first..nums.last).to_a - nums
end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
