def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

def word_cap(string)
  string.split.map do |word|
    word.chars.each_with_index do |char, idx|
      idx == 0 ? char.upcase! : char.downcase!
    end.join
  end.join(' ')
end

# Can also use gsub and regex. Can also check for 1st character of words by
# using == ' ' on the previous character

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
