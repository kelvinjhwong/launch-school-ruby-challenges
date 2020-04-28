=begin
**Line 22**

* We're re-assigning the local variable `cards` to
  point to the object at each value of the `deck` hash in turn.
* However, this is actually a useless line, since the `deck`'s
  values are already the Array object that's currently being
  referenced by the variable `cards`.
* So this line is just re-assigning `cards` to the object
  it already points to.

**Line 24**

* The method invocation `cards.pop` removes the last element
  from the `cards` Array permanently, and appends it to the
  Array object referenced by the local variable `player_cards`.
* This is a destructive action, leaving `cards` with one fewer
  element.
* Since all the values of the hash `deck` also point to this
  same Array object, now the value of each key in `deck` is
  an Array with only 12 elements, or cards, left.
* So in lines 21-24 we're in fact not picking a fully
  random card from each suit; each time we pick e.g. a `4`,
  we remove the `4` card from all the other suits too,
  before picking another card

**Line 29**

* The block in lines 29 to 35 takes 3 parameters, one of which
  has name `cards`. This happens to have the same name as
  one of the local variables in the outer scope, which
  prevents the entire block from accessing the
  outer variable's value throughout block execution.
* This is called variable shadowing, and is usually bad
  practice, and best avoided. Even if the code still functions
  correctly, someone else reading your code may not know
  if it was intentional

**Lines 30-32**

* This method invocation is completely redundant - #map is
  a non-mutating method, so `cards`'s value remains unchanged
  after #map's invocation; yet the invocation's return value is
  also not saved to any variable. So nothing resulting from this
  method invocation can be used afterwards.
* `cards`'s elements remain unchanged, and are not changed
  to their respective scores.

**Line 34**

* This line returns the result of the #= assignment operation,
  which is `sum + cards.sum`.
* However, `cards.sum` may actually throw an error, since `cards`'s
  elements are now a subset of its original elements. So
  some of them may still be symbols e.g. `:jack`, `:queen`,
  but the #sum method only takes as arguments Arrays
  whose elements are all of the same type - either
  all Strings or all numbers.
* Also, since #reduce here only takes the return value
  of its block argument, and re-assigns it to its `sum`
  parameter on the block's next execution, the `sum = `
  assignment on this line is also redundant.

=end

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => CARDS.dup,
         :diamonds => CARDS.dup,
         :clubs    => CARDS.dup,
         :spades   => CARDS.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  player_cards << deck[suit].shuffle!.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, cards)|
  sum + cards.map { |card| score(card) }.sum
end

puts sum
