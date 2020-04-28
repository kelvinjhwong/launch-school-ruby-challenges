=begin
In short, the reason is because on lines 3-5, we're mutating
the array `words` by deleting some of its elements as
we're iterating through it.

When the #each method is on the `words` array, it iterates
through the element at each index of the array.

However, when e.g. one element is deleted as a result of
the #delete method call on line 4, the array elements
'shift' to the left, meaning e.g. the element originally
at index i is now at index i - 1.

However #each method's invocation will not update its 'queue'
of indices whose elements are to be passed into its block.

This means that every time the an element is deleted
by the #delete method call on line 4, its next
element will be skipped by the #each method invocation.

As a result, the word 'boring', which appears directly after 
the word 'dull', will be skipped, and spared deletion.
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words.each_with_object([]) do |word, neutral_sentence|
    neutral_sentence << word unless negative?(word)
  end.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')