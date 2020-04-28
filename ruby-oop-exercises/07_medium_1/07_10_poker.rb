class Card
  include Comparable
  
  RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  RANKS_IN_ORDER = (2..10).to_a + %w(Jack Queen King Ace)
  SUITS_IN_ORDER = %w(Diamonds Clubs Hearts Spades)
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s
    "=> #{rank} of #{suit}"
  end
  
  def <=>(other_card)
    compare_rank = value <=> other_card.value
    case compare_rank
    when 0
      SUITS_IN_ORDER.index(suit) <=> SUITS_IN_ORDER.index(other_card.suit)
    else compare_rank
    end
  end
  
  def ==(other_card)
    to_s == other_card.to_s
  end
  
  def value
    RANK_VALUES.fetch(rank, rank)
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  attr_reader :cards
  
  def initialize
    reset_deck
  end
  
  def draw
    reset_deck if @cards.empty?
    @cards.pop
  end
  
  private
  
  def reset_deck
    @cards = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }
    @cards.shuffle!
  end
end

class PokerHand
  def initialize(deck)
    @cards = deal_hand(deck).sort
  end

  def print
    puts 'Your hand:'
    puts cards.sort
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  
  attr_reader :cards
  
  def deal_hand(deck)
    deck.class == Deck ? deck.cards.last(5) : deck
  end

  def royal_flush?
    straight_flush? && cards.max.rank == 'Ace'
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    cards.uniq(&:rank).size == 2 && !full_house?
  end

  def full_house?
    (cards.first(3).uniq(&:rank).size == 1 &&
    cards.last(2).uniq(&:rank).size == 1) ||
    (cards.first(2).uniq(&:rank).size == 1 &&
    cards.last(3).uniq(&:rank).size == 1)
  end

  def flush?
    cards.uniq(&:suit).size == 1
  end

  def straight?
    cards.uniq(&:rank).size == 5 && (cards.max.value - cards.min.value == 4)
  end

  def three_of_a_kind?
    cards.uniq(&:rank).size == 3 && !two_pair?
  end

  def two_pair?
    unique_cards_ranks = cards.uniq.map(&:rank)
    
    cards.uniq(&:rank).size == 3 &&
      unique_cards_ranks.all? do |rank|
        cards.count { |card| card.rank == rank } <= 2
      end
  end

  def pair?
    cards.uniq(&:rank).size == 4
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# hand = nil
# loop do
#   hand = PokerHand.new(Deck.new)
#   break if hand.evaluate == 'Royal flush'
# end
# hand.print

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
