NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven
                  twelve thirteen fourteen fifteen sixteen seventeen eighteen
                  nineteen)

def alphabetic_number_sort(array)
  array.sort_by { |num| NUMBER_WORDS[num] }
end

def alphabetic_number_sort(array)
  array.sort { |num1, num2| NUMBER_WORDS[num1] <=> NUMBER_WORDS[num2] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
