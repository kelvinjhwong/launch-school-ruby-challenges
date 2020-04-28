def substrings_at_start(str)
  str.length.times.reduce([]) { |arr, i| arr << str[0..i] }
end

def substrings(str)
  str.length.times.reduce([]) do |arr, i|
    arr.concat(substrings_at_start(str[i..-1]))
  end
end

def substrings(str)
  str.length.times.reduce([]) do |arr, i|
    1.upto(str.length - i).reduce(arr) do |arr_inner, j|
      arr_inner << str.slice(i, j)
    end
  end
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
