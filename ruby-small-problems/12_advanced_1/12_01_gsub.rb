ADJECTIVES = ['hardcore', 'pompous', 'galactic', 'convoluted', 'chivalrous']
NOUNS = ['pumpkin', 'gnome', 'panda', 'Garfield', 'sloth']
VERBS = ['vomits', 'kicks', 'fistbumps', 'pokes', 'indicts']
ADVERBS = ['gracefully', 'ferociously', 'gingerly', 'maniacally', 'mischievously']

WORDS = [ADJECTIVES, NOUNS, VERBS, ADVERBS]
word_types = ['%{adjective}', '%{noun}', '%{verb}', '%{adverb}']

lines = File.read('12_01_gsub.txt').split("\n")
lines.each do |line|
  4.times do |i|
    line.gsub!(word_types[i], WORDS[i].sample)
  end
end

puts lines
