def longest_sentence(text)
  sentences = text.split(/\.|\?|!/)

  longest_sentence = sentences.max_by { |sentence| sentence.split.size }
  longest_sentence = longest_sentence.strip
  number_of_words = longest_sentence.split.size
  
  puts longest_sentence
  puts "#{number_of_words} words"
end

def longest_word(text)
  words = text.split
  words = words[0..-2] if words[-1]=~ /[[:punct]]/
  
  longest_word = words.max_by(&:length)
  num_of_chars = longest_word.length
  
  puts longest_word
  puts "#{num_of_chars} characters"
end

def longest_paragraph(text)
  paragraphs = text.split(/\n{2,}/)

  longest_paragraph = paragraphs.max_by { |paragraph| paragraph.split.size }
  longest_paragraph = longest_paragraph.strip
  number_of_words = longest_paragraph.split.size
  
  puts longest_paragraph
  puts "#{number_of_words} words"
end

text1 = File.read('11_01_sample_text.txt')
longest_sentence(text1)
longest_word(text1)
longest_paragraph(text1)

text2 = File.read('11_01_frankenstein_body_only.txt')
longest_sentence(text2)
longest_word(text2)
longest_paragraph(text2)
