def crunch(string)
  crunched_string = ''
  string.chars.each do |char|
    crunched_string << char unless crunched_string[-1] == char
  end
  crunched_string
end

def crunch(string)
  string.gsub(/(.)\1{2,}/, '\1')
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
