def substrings_at_start(str)
  str.length.times.reduce([]) { |arr, i| arr << str[0..i] }
end

def substrings(str)
  str.length.times.reduce([]) do |arr, i|
    arr.concat(substrings_at_start(str[i..-1]))
  end
end

def palindromes(str)
  substrings(str).select do |substr|
    substr.length > 1 && substr == substr.reverse
  end
end

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]