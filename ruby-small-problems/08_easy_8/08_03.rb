def substrings_at_start(str)
  chars = str.chars
  chars.each_with_index.reduce([]) { |arr, (_, idx)| arr << chars[0..idx].join }
end

def substrings_at_start(str)
  str.length.times.reduce([]) { |arr, i| arr << str[0..i] }
end

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
