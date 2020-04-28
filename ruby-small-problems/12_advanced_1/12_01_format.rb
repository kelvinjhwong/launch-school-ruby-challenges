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
NOUNS = ['pumpkin', 'gnome', 'panda', 'kitten', 'sloth']
VERBS = ['vomits', 'kicks', 'fistbumps', 'pokes', 'indicts']
ADVERBS = ['gracefully', 'ferociously', 'gingerly', 'maniacally', 'mischievously']

lines = File.read('12_01_format.txt').split("\n")
lines.each_with_index do |line, idx|
  lines[idx] = format(line, adjective: ADJECTIVES.sample,
                            noun: NOUNS.sample,
                            verb: VERBS.sample,
                            adverb: ADVERBS.sample)
end

puts lines
