def word_to_digit(sentence)
  WORD_DIGITS.each_with_object(sentence) do |(word, digit), obj|
    obj.gsub!(/\b#{word}\b/, digit)
  end
end

WORD_DIGITS = {'one' => '1', 'two' => '2', 'three' => '3',
               'four' => '4', 'five' => '5', 'six' => '6',
               'seven' => '7', 'eight' => '8', 'nine' => '9',
               'zero' => '0'}

def number_word?(word)
  WORD_DIGITS.keys.any? { |key| word.downcase =~ /[^[:alnum]]*#{key}[^[:alnum]]*/ }
end

def number_word_not_at_end?(word)
  WORD_DIGITS.keys.any? { |key| word.downcase == key }
end

def number_word_at_end?(word)
  WORD_DIGITS.keys.any? { |key| word.downcase =~ /[^[:alnum]]*#{key}[^[:alnum]]+/ }
end

def word_to_digit(sentence)
  new_sentence = ''
  
  sentence_array = sentence.split
  sentence_array.each_with_index do |word, idx|
    if number_word_not_at_end?(word)
      if idx + 1 < sentence_array.size && number_word?(sentence_array[idx + 1])
        new_sentence << WORD_DIGITS[word.downcase]
      else
        new_sentence << WORD_DIGITS[word.downcase] + ' '
      end
    elsif number_word_at_end?(word)
      alpha_part = word.gsub(/[^a-z]/i, '')
      new_sentence << word.gsub(alpha_part, WORD_DIGITS[alpha_part.downcase]) + ' '
    else
      new_sentence << word + ' '
    end
  end
  new_sentence.chop!

  new_sentence.gsub!(/(\D)(\d{3})(\d{3})(\d{4})(\D)/, '\1(\2) \3-\4\5')

  new_sentence
end

# Not used
def remove_spaces_between_digits(sentence)
  while sentence =~ /([0-9]) ([0-9])/
    sentence.gsub!(/([0-9]) ([0-9])/, '\1\2')
  end
end

word_to_digit('Please call me at five five five one two three four. Thanks.')

word_to_digit('Please call 8 9 at six eight zero five five five one two three four. Thanks.')

word_to_digit('The number is two one six five five five one two six four.')

word_to_digit('There are three five six people here.')

word_to_digit("Ph: FIVE five five one two three four two three four. Not formatted: 1000000000000 99 9 9. More numbers: one two three")

word_to_digit('Please call, me at +1 five FIVE five one two three four five five five. Thanks.')

word_to_digit('Test existing digits 0 00 0 one two three four five six')