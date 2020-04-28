def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

=begin
* On line 7, `words[i] + reversed_words` is Ruby's syntactical
  sugar for `words[i].+(reversed_wrds)`. Here, we're calling
  the String method `.+` on the String element words[i].

* Ruby also has a method of the same name for Array objects,
  which can be called thus: `array1 + array2`, which is
  also syntactical sugar for `array1.+(array2)`.

* In the above example, line 7 mixes the two. We can either
  concatenate a String with a String, or an Array with an
  Array, but not a String with an Array

* Therefore, on line 7, method expects String arguments
  only, but `reversed_words` is an Array i.e. the
  wrong type, so Ruby throws a TypeError.
=end