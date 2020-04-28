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
  HAND_METHODS = [:royal_flush?, :straight_flush?, :four_of_a_kind?] +
                 [:full_house?, :flush?, :straight?, :three_of_a_kind?] +
                 [:two_pair?, :pair?]
                 
  attr_reader :cards
  
  def initialize(deck)
    @card_ranks = Hash.new(0)
    @cards = deal_hand(deck).sort
    tally_card_ranks
  end
  
  def tally_card_ranks
    cards.each { |card| @card_ranks[card.rank] += 1 }
  end

  def print
    puts 'Your hand:'
    puts cards.sort
  end
  
  def self.first_hand_method_match(cards)
    HAND_METHODS.select do |hand_method|
      PokerHand.new(cards).send(hand_method)
    end.first    
  end
  
  def self.royal_flush?(cards)
    first_hand_method_match(cards) == :royal_flush?
  end

  def self.straight_flush?(cards)
    first_hand_method_match(cards) == :straight_flush?
  end

  def self.four_of_a_kind?(cards)
    first_hand_method_match(cards) == :four_of_a_kind?
  end

  def self.full_house?(cards)
    first_hand_method_match(cards) == :full_house?
  end

  def self.flush?(cards)
    first_hand_method_match(cards) == :flush?
  end

  def self.straight?(cards)
    first_hand_method_match(cards) == :straight?
  end

  def self.three_of_a_kind?(cards)
    first_hand_method_match(cards) == :three_of_a_kind?
  end

  def self.two_pair?(cards)
    first_hand_method_match(cards) == :two_pair?
  end

  def self.pair?(cards)
    first_hand_method_match(cards) == :pair?
  end
  
  def self.high_card?(cards)
    first_hand_method_match(cards).nil?
  end
  
  private
  
  attr_reader :card_ranks
  
  def deal_hand(deck)
    deck.class == Deck ? deck.cards.last(5) : deck
  end
  
  def n_of_a_kind?(number)
    card_ranks.one? { |_, count| count == number }
  end

  def royal_flush?
    straight_flush? && cards.max.rank == 'Ace'
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def flush?
    cards.uniq(&:suit).size == 1
  end

  def straight?
    card_ranks.all? { |_, count| count == 1 } &&
    (cards.max.value - cards.min.value == 4)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    card_ranks.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_a_kind?(2)
  end
end

# Test script:
#
# hand = nil
# loop do
#   hand = PokerHand.new(Deck.new)
#   break if PokerHand.straight_flush?(hand.cards)
# end
# hand.print

puts PokerHand.royal_flush?([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])

puts PokerHand.straight_flush?([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])

puts PokerHand.four_of_a_kind?([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])

puts = PokerHand.full_house?([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])

puts PokerHand.flush?([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])

puts PokerHand.straight?([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])

puts PokerHand.straight?([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])

puts PokerHand.three_of_a_kind?([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])

puts PokerHand.two_pair?([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])

puts PokerHand.pair?([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])

puts PokerHand.high_card?([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
