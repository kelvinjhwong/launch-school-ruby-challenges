def print_in_box(string)
  l = string.length
  puts '+' + '-'*(l + 2) + '+'
  puts '|' + ' '*(l + 2) + '|'
  puts '| ' + string + ' |'
  puts '|' + ' '*(l + 2) + '|'
  puts '+' + '-'*(l + 2) + '+'
end

def print_in_box_80(string)
  string = string[0..75] if string.length > 76
  l = string.length
  puts '+' + '-'*(l + 2) + '+'
  puts '|' + ' '*(l + 2) + '|'
  puts '| ' + string + ' |'
  puts '|' + ' '*(l + 2) + '|'
  puts '+' + '-'*(l + 2) + '+'
end

# Work out number of lines using string length
# If just 1 line, then proceed as before
# Else if more than 1 line, then break up string into substrings
# of length 76 or less, and store substrings in array
# Pad last substring with spaces on the right, to make it up to 76 characters
# Puts substrings onto screen as before

def print_in_box_wrap(string)
  if string.length <= 76
    num_lines = 1
    box_inner_length = string.length + 2
    lines = [string]
  else
    num_lines = (string.length.to_f / 76).ceil
    box_inner_length = 78
    lines = []
    string_to_slice = string.dup
    num_lines.times { lines << string_to_slice.slice!(0..75) }
    lines[-1] = lines[-1].ljust(76)
  end
  
  puts '+' + '-'*box_inner_length + '+'
  puts '|' + ' '*box_inner_length + '|'
  lines.each { |line| puts '| ' + line + ' |' }
  puts '|' + ' '*box_inner_length + '|'
  puts '+' + '-'*box_inner_length + '+'
end

def print_in_box_wrap_word(string)
  if string.length <= 76
    num_lines = 1
    box_inner_length = string.length + 2
    lines = [string]
  else
    num_lines = (string.length.to_f / 76).ceil
    box_inner_length = 78
    words = string.split
    lines = []
    each_line = ''
    words.each do |word|
      if each_line.length + word.length <= 75
        each_line << (word + ' ')
      elsif each_line.length + word.length == 76
        each_line << word
      else
        lines << each_line
        each_line = word + ' '
      end
    end
    lines << each_line
    lines = lines.map { |line| line.ljust(76) }
  end
  
  puts '+' + '-'*box_inner_length + '+'
  puts '|' + ' '*box_inner_length + '|'
  lines.each { |line| puts '| ' + line + ' |' }
  puts '|' + ' '*box_inner_length + '|'
  puts '+' + '-'*box_inner_length + '+'
end

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
