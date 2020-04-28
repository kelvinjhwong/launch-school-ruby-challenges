# Numbers?
# Initial leading or trailing spaces? Assume none
# Split string into characters
# Map non-alphabetical characters to ' '
# Join characters again
# Condense contiguous spaces into 1 space

require 'pry'

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(string)
  new_str = string.chars.map do |char|
    ALPHABETS.include?(char) ? char : ' '
  end
  cleaned_str = new_str.join.split.join(' ')
  cleaned_str.prepend(' ') if new_str[0] == ' '
  cleaned_str << ' ' if new_str[-1] == ' '
end

def cleanup(string)
  new_str = string.chars.map do |char|
    ALPHABETS.include?(char) ? char : ' '
  end
  new_str.join.squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

# Other String methods that can be used: gsub, tr, match