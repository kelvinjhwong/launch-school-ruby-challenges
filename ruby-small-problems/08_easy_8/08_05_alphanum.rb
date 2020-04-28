def substrings_at_start(str)
  str.length.times.reduce([]) { |arr, i| arr << str[0..i] }
end

def substrings(str)
  str.length.times.reduce([]) do |arr, i|
    arr.concat(substrings_at_start(str[i..-1]))
  end
end

def palindrome?(str)
  str.length > 1 && str.downcase == str.reverse.downcase
end

def palindromes(str)
  str = str.gsub(/[^[:alnum:]]/, '')
  substrings(str).select { |substr| palindrome?(substr) }
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