# Decide where to insert which type of word into text
# Break text into lines, where end of each line is
#   where we'd like to insert a specific type of new words,
#   and where each line ends with a space
# Load text from file into variable
# Split text by '\n' into array of lines
# Concat each line with the random choice of right type of
# new word, followed by ' '
# Join array with '\n' then puts the string

ADJECTIVES = ['hardcore', 'pompous', 'galactic', 'convoluted', 'chivalrous']
NOUNS = ['pumpkin', 'gnome', 'panda', 'Garfield', 'sloth']
VERBS = ['regurgitate', 'kick', 'bellyflop', 'rap', 'bark']
ADVERBS = ['gracefully', 'ferociously', 'gingerly', 'maniacally', 'mischievously']

WORDS = [ADJECTIVES, NOUNS, VERBS, ADVERBS]

text = File.read('12_01.txt')
lines = text.split("\n")
mad_lines = lines.each_with_index do |line, idx|
  line << (WORDS[idx % 4].sample + ' ') unless idx == 8
end

puts mad_lines.join