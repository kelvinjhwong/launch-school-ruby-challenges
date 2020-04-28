def word_sizes(string)
  sizes = {}
  string.split.each do |word|
    sizes[word.length] = sizes[word.length].nil? ? 1 : (sizes[word.length] + 1)
  end
  sizes
end

def word_sizes(string)
  sizes = Hash.new(0)
  string.split.each { |word| sizes[word.length] += 1 }
  sizes
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
