# Input: array of strings representing vehicles
# Output: hash with strings as keys, and integers as values

# - Initialise hash with one key for each type of vehicle and
#   all values 0, using the #uniq and #each methods on the
#   input array
# - Iterate through input array using #each, incrementing the
#   the corresponding hash value by 1
# - Return the final hash

def count_occurrences(array)
  occurrences = {}
  array.uniq.each { |element| occurrences[element] = 0 }
  
  array.each { |element| occurrences[element] += 1 }
  
  occurrences
end

def count_occurrences(array)
  occurrences = {}

  array.each { |element| occurrences[element] = array.count(element) }
  
  occurrences.each { |element, count| puts "#{element} => #{count}" }
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
