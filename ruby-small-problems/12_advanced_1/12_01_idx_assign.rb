ADJECTIVES = ['hardcore', 'pompous', 'galactic', 'convoluted', 'chivalrous']
NOUNS = ['pumpkin', 'gnome', 'panda', 'Garfield', 'sloth']
VERBS = ['vomits', 'kicks', 'fistbumps', 'pokes', 'indicts']
ADVERBS = ['gracefully', 'ferociously', 'gingerly', 'maniacally', 'mischievously']

WORDS = [ADJECTIVES, NOUNS, VERBS, ADVERBS]
word_types = ['%{adjective}', '%{noun}', '%{verb}', '%{adverb}']

text = File.read('12_01_gsub.txt')
words = text.split
words.each_with_index do |word, idx|
  4.times do |i|
    words[idx] = WORDS[i].sample if word == word_types[i]
  end
end

p words.join(' ')
