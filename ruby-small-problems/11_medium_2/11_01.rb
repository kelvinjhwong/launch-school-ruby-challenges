# - Split text into an array of words
# - Iterate through array; identify words with ., ! or ? as
#   last character, and shift each full sentence into
#   new sentences array
# - Split each sentence further into its words, saved as
#   a sub-array
# - Search for the sub-array with greatest length
# - Save sub-array into a new longest_sentences array,
#   in case there are more than one longest sentence
# - Print each sub-array in the longest_sentences array
# - Print its length
# - Return nil

# How to deal with new line characters? Not sure yet...

def longest_sentence(text)
  words = text.split

  sentence_end_indexes = []
  sentence_lengths = []
  words.each_with_index do |word, idx|
    if ['.', '!', '?'].include? word[-1]
      sentence_end_indexes << idx
      if !sentence_lengths.empty?
        sentence_lengths << idx - sentence_end_indexes[-2]
      else
        sentence_lengths << idx + 1
      end
    end
  end

  longest_sentence_length = 0
  longest_sentence_indexes = []
  sentence_lengths.each_with_index do |length, idx|
    if length > longest_sentence_length
      longest_sentence_length = length
      longest_sentence_indexes = [idx]
    elsif length == longest_sentence_length
      longest_sentence_indexes << idx
    end
  end

  longest_sentence_indexes.each do |sentence_idx|
    first_word_index = sentence_end_indexes[sentence_idx - 1] + 1
    last_word_index = sentence_end_indexes[sentence_idx]
    longest_sentence = words[first_word_index..last_word_index].join(' ')
    puts "Longest sentence:\n\n#{longest_sentence}"
  end
  puts "\nLongest sentence(s) length: #{longest_sentence_length} words"
end

text1 = File.read('11_01_sample_text.txt')
longest_sentence(text1)

text2 = File.read('11_01_frankenstein.txt')
longest_sentence(text2)
