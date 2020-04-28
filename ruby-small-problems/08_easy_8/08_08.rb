def double_consonants(string)
  string.gsub(/([a-z&&[^aeiou]])/i, '\1\1')
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
