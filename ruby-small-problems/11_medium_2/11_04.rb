def balanced?(string)
  return false if string.count('(') != string.count(')')
  parentheses = string.chars.select { |char| char = '(' || char = ')' }
  parentheses.each_with_index do |char, idx|
    if parentheses[0..idx].count(')') > parentheses[0..idx].count('(')
      return false
    end
  end
  true
end

def balanced?(string)
  parentheses = 0
  string.each_char do |char|
    parentheses += 1 if char == '('
    parentheses -= 1 if char == ')'
    return false if parentheses < 0
  end
  
  parentheses.zero?
end

def balanced?(string)
  parentheses = 0
  string.each_char do |char|
    parentheses += 1 if char == '('
    parentheses -= 1 if char == ')'
    if parentheses < 0
      puts "Missing a '('!"
      return false
    end
  end

  squares = 0
  string.each_char do |char|
    squares += 1 if char == '['
    squares -= 1 if char == ']'
    if squares < 0
      puts "Missing a '['!"
      return false
    end
  end

  curls = 0
  string.each_char do |char|
    curls += 1 if char == '{'
    curls -= 1 if char == '}'
    if curls < 0
      puts "Missing a '{'!"
      return false
    end
  end

  if string.count("'").odd?
    puts "Missing a '!"
    return false
  end
  
  if string.count('"').odd?
    puts 'Missing a "!'
    return false
  end
  
  parentheses.zero? && squares.zero? && curls.zero?
end

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
