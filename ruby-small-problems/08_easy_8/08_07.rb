def repeater(string)
  string.chars.zip(string.chars).flatten.join
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
