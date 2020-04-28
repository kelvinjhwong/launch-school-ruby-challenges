def penultimate(string)
  string.split[-2]
end

def middle_word(phrase)
  return '' if string.split.empty?
  phrase.split[phrase.split.size / 2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
