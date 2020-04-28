def letter_percentages(string)
  string_length = string.length

  lowercase_percentage = string.count('a-z')/string_length.to_f*100
  uppercase_percentage = string.count('A-Z')/string_length.to_f*100
  neither_percentage = string.count('^a-zA-Z')/string_length.to_f*100

  { lowercase: lowercase_percentage,
    uppercase: uppercase_percentage,
      neither: neither_percentage }
end

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
