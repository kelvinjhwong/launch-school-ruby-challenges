def include?(array, element)
  value = false
  array.each do |arr_element|
    if arr_element == element
      value = true
      break
    end
  end
  value
end

def include?(array, element)
  array.each { |arr_element| return true if arr_element == element }
  false
end

def include?(array, element)
  !!array.find_index(element)
end

# Can also use: #index, #count, #any?, Array#-

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
