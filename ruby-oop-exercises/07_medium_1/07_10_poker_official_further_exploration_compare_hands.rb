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
    value <=> other_card.value
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
  include Comparable
  
  HANDS = ['High card', 'Pair', 'Two pair', 'Three of a kind'] +
          ['Straight', 'Flush', 'Full house', 'Four of a kind'] +
          ['Straight flush', 'Royal flush']

  HAND_METHODS = [:royal_flush?, :straight_flush?, :four_of_a_kind?] +
                 [:full_house?, :flush?, :straight?, :three_of_a_kind?] +
                 [:two_pair?, :pair?]
  
  def initialize(deck)
    @card_ranks = Hash.new(0)
    @card_rank_values = Hash.new(0)
    @cards = deal_hand(deck).sort
    tally_card_ranks
    tally_card_rank_values
  end
  
  def tally_card_ranks
    cards.each { |card| @card_ranks[card.rank] += 1 }
  end
  
  def tally_card_rank_values
    cards.each { |card| @card_rank_values[card.value] += 1 }
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
    when high_card?       then 'High card'
    end
  end

  def <=>(other_hand)
    compare_between_hands = 
      HANDS.index(self.evaluate) <=> HANDS.index(other_hand.evaluate)

    case compare_between_hands
    when 0
      compare_within_hand(other_hand)
    else
      compare_between_hands
    end
  end
  
  def compare_within_hand(other_hand)
    hand_name = self.evaluate
    hand_name_for_sym = hand_name.downcase.gsub(' ', '_')
    send("compare_within_#{hand_name_for_sym}".to_sym, other_hand)
  end

  def best_hand_cards
    return cards if cards.size == 5
    cards.combination(5).to_a.map do |cards_arr|
      PokerHand.new(cards_arr)
    end.max.cards
  end

  protected
  
  attr_reader :cards, :card_ranks, :card_rank_values
  
  private
  
  def deal_hand(deck)
    deck.class == Deck ? deck.cards.last(5) : deck
  end
  
  def n_of_a_kind?(number)
    card_ranks.one? { |_, count| count == number }
  end

  def royal_flush?
    straight_flush? && cards.max.rank == 'Ace'
  end
  
  def compare_within_royal_flush(other_hand)
    0
  end

  def straight_flush?
    flush? && straight?
  end
  
  def compare_within_straight_flush(other_hand)
    cards.max <=> other_hand.cards.max
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def compare_within_four_of_a_kind(other_hand)
    compare_quadruplets = 
      card_rank_values.key(4) <=> other_hand.card_rank_values.key(4)

    case compare_quadruplets
    when 0 then compare_singleton_cards(other_hand)
    else        compare_quadruplets
    end
  end
  
  def full_house?
    n_of_a_kind?(3) && n_of_a_kind?(2)
  end

  def compare_within_full_house(other_hand)
    compare_triplets = 
      card_rank_values.key(3) <=> other_hand.card_rank_values.key(3)

    case compare_triplets
    when 0
      card_rank_values.key(2) <=> other_hand.card_rank_values.key(2)
    else
      compare_triplets
    end
  end
  
  def flush?
    cards.uniq(&:suit).size == 1
  end

  def compare_within_flush(other_hand)
    compare_singleton_cards(other_hand)
  end
  
  def straight?
    card_ranks.all? { |_, count| count == 1 } &&
    (cards.max.value - cards.min.value == 4)
  end

  def compare_within_straight(other_hand)
    cards.max <=> other_hand.cards.max
  end
  
  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def compare_within_three_of_a_kind(other_hand)
    compare_triplets = 
      card_rank_values.key(3) <=> other_hand.card_rank_values.key(3)

    case compare_triplets
    when 0 then compare_singleton_cards(other_hand)
    else compare_triplets
    end
  end
  
  def two_pair?
    card_ranks.select { |_, count| count == 2 }.size == 2
  end

  def compare_within_two_pair(other_hand)
    pairs_rank_values = card_rank_values.keys.select do |rank_value|
      card_rank_values[rank_value] == 2
    end.sort
    
    other_hand_pairs_rank_values = 
      other_hand.card_rank_values.keys.select do |rank_value|
        other_hand.card_rank_values[rank_value] == 2
      end.sort
    
    compare_highest_pairs =
      pairs_rank_values.last <=> other_hand_pairs_rank_values.last
    
    case compare_highest_pairs
    when 0
      compare_lowest_pairs = 
        pairs_rank_values.first <=> other_hand_pairs_rank_values.first
      
      case compare_lowest_pairs
      when 0 then compare_singleton_cards(other_hand)
      else        compare_lowest_pairs
      end
    else compare_highest_pairs
    end
  end
  
  def pair?
    n_of_a_kind?(2)
  end
  
  def compare_within_pair(other_hand)
    compare_pairs = 
      card_rank_values.key(2) <=> other_hand.card_rank_values.key(2)
    
    compare_pairs == 0 ? compare_singleton_cards(other_hand) : compare_pairs
  end
  
  def high_card?
    HAND_METHODS.all? do |hand_method|
      send(hand_method) == false
    end
  end
  
  def compare_within_high_card(other_hand)
    compare_singleton_cards(other_hand)
  end
  
  def compare_singleton_cards(other_hand)
    singleton_cards = cards.select { |card| card_ranks[card.rank] == 1 }.sort

    other_hand_singleton_cards =
      other_hand.cards.select do |card|
        other_hand.card_ranks[card.rank] == 1
      end.sort
    
    (singleton_cards.size - 1).downto(0) do |idx|
      compare_cards = (singleton_cards[idx] <=> other_hand_singleton_cards[idx])
      return compare_cards unless compare_cards == 0
    end
    0
  end
end

# ----------------------------- Test cases -----------------------------

# Test cases for comparing between hands

# Royal flush > Straight flush
puts PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
]) >
  PokerHand.new([
    Card.new(8,       'Clubs'),
    Card.new(9,       'Clubs'),
    Card.new('Queen', 'Clubs'),
    Card.new(10,      'Clubs'),
    Card.new('Jack',  'Clubs')
  ])

# Straight flush > Four of a kind
puts PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
]) >
  PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(3, 'Diamonds')
  ])

# Four of a kind > Full house
puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
]) >
  PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(5, 'Hearts')
  ])

# Full house > Flush
puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
]) >
  PokerHand.new([
    Card.new(10, 'Hearts'),
    Card.new('Ace', 'Hearts'),
    Card.new(2, 'Hearts'),
    Card.new('King', 'Hearts'),
    Card.new(3, 'Hearts')
  ])

# Flush > Straight1
puts PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
]) >
  PokerHand.new([
    Card.new(8,      'Clubs'),
    Card.new(9,      'Diamonds'),
    Card.new(10,     'Clubs'),
    Card.new(7,      'Hearts'),
    Card.new('Jack', 'Clubs')
  ])

# Straight1 < Straight2
puts PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
]) <
  PokerHand.new([
    Card.new('Queen', 'Clubs'),
    Card.new('King',  'Diamonds'),
    Card.new(10,      'Clubs'),
    Card.new('Ace',   'Hearts'),
    Card.new('Jack',  'Clubs')
  ])

# Straight2 > Three of a kind
puts PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
]) >
  PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(6, 'Diamonds')
  ])

# Three of a kind > Two pair
puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
]) >
  PokerHand.new([
    Card.new(9, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(8, 'Spades'),
    Card.new(5, 'Hearts')
  ])

# Two pair > Pair
puts PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
]) >
  PokerHand.new([
    Card.new(2, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(5, 'Diamonds'),
    Card.new(9, 'Spades'),
    Card.new(3, 'Diamonds')
  ])

# Pair > High card
puts PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
]) >
  PokerHand.new([
    Card.new(2,      'Hearts'),
    Card.new('King', 'Clubs'),
    Card.new(5,      'Diamonds'),
    Card.new(9,      'Spades'),
    Card.new(3,      'Diamonds')
  ])

puts '-------------------------------------'

# Test cases for comparing within each hand

# Royal flush
puts PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
]) ==
  PokerHand.new([
    Card.new(10,      'Spades'),
    Card.new('Ace',   'Spades'),
    Card.new('Queen', 'Spades'),
    Card.new('King',  'Spades'),
    Card.new('Jack',  'Spades')
  ])

# Straight flush
puts PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
]) ==
  PokerHand.new([
    Card.new(9,       'Spades'),
    Card.new(10,       'Spades'),
    Card.new('Queen', 'Spades'),
    Card.new(8,      'Spades'),
    Card.new('Jack',  'Spades')
  ])

puts PokerHand.new([
  Card.new('King',  'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
]) >
  PokerHand.new([
    Card.new(6, 'Hearts'),
    Card.new(5, 'Hearts'),
    Card.new(9, 'Hearts'),
    Card.new(8, 'Hearts'),
    Card.new(7, 'Hearts')
  ])

# Four of a kind
puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
]) <
  PokerHand.new([
    Card.new('Queen', 'Hearts'),
    Card.new('Queen', 'Clubs'),
    Card.new('Queen', 'Diamonds'),
    Card.new('Queen', 'Spades'),
    Card.new('Jack', 'Diamonds')
  ])

puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
]) <
  PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(3, 'Clubs'),
    Card.new(8, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(3, 'Diamonds')
  ])

# Full house
puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(10, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(10, 'Hearts')
]) <
  PokerHand.new([
    Card.new('Jack', 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new('Jack', 'Diamonds'),
    Card.new('Jack', 'Spades'),
    Card.new(9, 'Hearts')
  ])

puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(10, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(10, 'Hearts')
]) >
  PokerHand.new([
    Card.new(3, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(3, 'Diamonds'),
    Card.new(3, 'Spades'),
    Card.new(9, 'Hearts')
  ])

# Flush
puts PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
]) >
  PokerHand.new([
    Card.new('Ace', 'Diamonds'),
    Card.new(5, 'Diamonds'),
    Card.new(9, 'Diamonds'),
    Card.new('Queen', 'Diamonds'),
    Card.new(2, 'Diamonds')
  ])

puts PokerHand.new([
  Card.new(10, 'Spades'),
  Card.new('Jack', 'Spades'),
  Card.new(2, 'Spades'),
  Card.new(6, 'Spades'),
  Card.new(3, 'Spades')
]) >
  PokerHand.new([
    Card.new(3, 'Clubs'),
    Card.new(5, 'Clubs'),
    Card.new(10, 'Clubs'),
    Card.new('Jack', 'Clubs'),
    Card.new(2, 'Clubs')
  ])

puts PokerHand.new([
  Card.new(10, 'Spades'),
  Card.new('Jack', 'Spades'),
  Card.new(2, 'Spades'),
  Card.new('King', 'Spades'),
  Card.new(3, 'Spades')
]) ==
  PokerHand.new([
    Card.new(3, 'Clubs'),
    Card.new('King', 'Clubs'),
    Card.new(10, 'Clubs'),
    Card.new('Jack', 'Clubs'),
    Card.new(2, 'Clubs')
  ])

# Straight
puts PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Spades'),
  Card.new('Queen', 'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Diamonds')
]) ==
  PokerHand.new([
    Card.new(9,       'Clubs'),
    Card.new(10,       'Spades'),
    Card.new('Queen', 'Spades'),
    Card.new(8,      'Diamonds'),
    Card.new('Jack',  'Spades')
  ])

puts PokerHand.new([
  Card.new('King',  'Spades'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Diamonds')
]) >
  PokerHand.new([
    Card.new(6, 'Hearts'),
    Card.new(5, 'Clubs'),
    Card.new(9, 'Diamonds'),
    Card.new(8, 'Clubs'),
    Card.new(7, 'Hearts')
  ])

# Three of a kind
puts PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new('Ace', 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new('King', 'Diamonds')
]) <
  PokerHand.new([
    Card.new(9, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(4, 'Diamonds'),
    Card.new(9, 'Spades'),
    Card.new(5, 'Hearts')
  ])

puts PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(4, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new('King', 'Diamonds')
]) >
  PokerHand.new([
    Card.new(9, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(4, 'Diamonds'),
    Card.new(9, 'Spades'),
    Card.new(5, 'Hearts')
  ])

puts PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(4, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new('King', 'Diamonds')
]) ==
  PokerHand.new([
    Card.new(9, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(4, 'Spades'),
    Card.new(9, 'Spades'),
    Card.new('King', 'Hearts')
  ])

# Two pair
puts PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
]) >
  PokerHand.new([
    Card.new(9, 'Diamonds'),
    Card.new(9, 'Spades'),
    Card.new(5, 'Clubs'),
    Card.new(2, 'Spades'),
    Card.new(5, 'Spades')
  ])

puts PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
]) >
  PokerHand.new([
    Card.new(9, 'Diamonds'),
    Card.new(9, 'Spades'),
    Card.new(4, 'Clubs'),
    Card.new(2, 'Spades'),
    Card.new(4, 'Spades')
  ])

puts PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new('Ace', 'Spades'),
  Card.new(5, 'Hearts')
]) <
  PokerHand.new([
    Card.new('Ace', 'Hearts'),
    Card.new('Ace', 'Clubs'),
    Card.new(5, 'Clubs'),
    Card.new(4, 'Spades'),
    Card.new(5, 'Spades')
  ])

puts PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new(10, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new('King', 'Spades'),
  Card.new(5, 'Hearts')
]) >
  PokerHand.new([
    Card.new(9, 'Hearts'),
    Card.new(9, 'Clubs'),
    Card.new(7, 'Diamonds'),
    Card.new(8, 'Spades'),
    Card.new(7, 'Hearts')
  ])

puts PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new(10, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new('King', 'Spades'),
  Card.new(5, 'Hearts')
]) ==
  PokerHand.new([
    Card.new(10, 'Diamonds'),
    Card.new(10, 'Hearts'),
    Card.new(5, 'Clubs'),
    Card.new('King', 'Clubs'),
    Card.new(5, 'Spades')
  ])

# Pair
puts PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
]) <
  PokerHand.new([
    Card.new(8, 'Hearts'),
    Card.new(9, 'Diamonds'),
    Card.new(10, 'Diamonds'),
    Card.new(9, 'Hearts'),
    Card.new('Ace', 'Diamonds')
  ])

puts PokerHand.new([
  Card.new(4, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
]) >
  PokerHand.new([
    Card.new(2,      'Hearts'),
    Card.new('King', 'Clubs'),
    Card.new(7,      'Diamonds'),
    Card.new('Ace',  'Spades'),
    Card.new(2,      'Diamonds')
  ])

puts PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new('Ace', 'Clubs'),
  Card.new(9, 'Spades'),
  Card.new(7, 'Diamonds')
]) <
  PokerHand.new([
    Card.new(8, 'Hearts'),
    Card.new(9, 'Diamonds'),
    Card.new(10, 'Diamonds'),
    Card.new(9, 'Hearts'),
    Card.new('Ace', 'Diamonds')
  ])

# High card

puts PokerHand.new([
  Card.new(2,      'Clubs'),
  Card.new('King', 'Diamonds'),
  Card.new(5,      'Spades'),
  Card.new(9,      'Hearts'),
  Card.new(3,      'Hearts')
]) >
  PokerHand.new([
    Card.new(8,      'Hearts'),
    Card.new('Jack', 'Clubs'),
    Card.new(6,      'Diamonds'),
    Card.new(9,      'Spades'),
    Card.new(10,      'Diamonds')
  ])

puts PokerHand.new([
  Card.new(2,      'Clubs'),
  Card.new('Jack', 'Diamonds'),
  Card.new(5,      'Spades'),
  Card.new(9,      'Hearts'),
  Card.new(3,      'Hearts')
]) ==
  PokerHand.new([
    Card.new(3,      'Hearts'),
    Card.new('Jack', 'Clubs'),
    Card.new(9,      'Diamonds'),
    Card.new(5,      'Spades'),
    Card.new(2,      'Diamonds')
  ])

puts PokerHand.new([
  Card.new(2,      'Clubs'),
  Card.new('Jack', 'Diamonds'),
  Card.new(5,      'Spades'),
  Card.new(9,      'Hearts'),
  Card.new(3,      'Hearts')
]) <
  PokerHand.new([
    Card.new(3,      'Hearts'),
    Card.new('Jack', 'Clubs'),
    Card.new(9,      'Diamonds'),
    Card.new(5,      'Spades'),
    Card.new(4,      'Diamonds')
  ])

puts '-------------------------------------'

# Test cases for best 5-card hand from 7-card hand

puts PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
]).best_hand_cards
puts

puts PokerHand.new([
  Card.new(9,       'Clubs'),
  Card.new(10,       'Spades'),
  Card.new('Queen', 'Spades'),
  Card.new(8,      'Diamonds'),
  Card.new('Jack',  'Spades')
]).best_hand_cards
puts

puts PokerHand.new([
  Card.new(8,      'Hearts'),
  Card.new('Jack', 'Clubs'),
  Card.new(6,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(10,      'Diamonds')
]).best_hand_cards
puts

puts 'Should return Flush'
puts PokerHand.new([
  Card.new(9,      'Hearts'),
  Card.new('Ace', 'Diamonds'),
  Card.new(4,      'Clubs'),
  Card.new('King',      'Diamonds'),
  Card.new(8,      'Diamonds'),
  Card.new(6, 'Diamonds'),
  Card.new(2, 'Diamonds')
]).best_hand_cards
puts

puts 'Should return High card'
puts PokerHand.new([
  Card.new(9,      'Hearts'),
  Card.new('Ace', 'Diamonds'),
  Card.new(4,      'Clubs'),
  Card.new('King',      'Diamonds'),
  Card.new(8,      'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new('Queen', 'Clubs')
]).best_hand_cards
puts

puts 'Should return Two pair'
puts PokerHand.new([
  Card.new('Queen',      'Hearts'),
  Card.new('King', 'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',      'Hearts'),
  Card.new(10,      'Spades'),
  Card.new('Queen', 'Spades'),
  Card.new(3, 'Diamonds')
]).best_hand_cards
puts

puts 'Should return Pair'
puts PokerHand.new([
  Card.new(9,      'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',      'Hearts'),
  Card.new(10,      'Spades'),
  Card.new('Queen', 'Spades'),
  Card.new(3, 'Diamonds')
]).best_hand_cards
puts

puts 'Should return Pair'
puts PokerHand.new([
  Card.new(6,      'Spades'),
  Card.new(4, 'Diamonds'),
  Card.new(5,      'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Ace',      'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(10, 'Clubs')
]).best_hand_cards
puts

puts 'Should return Pair'
puts PokerHand.new([
  Card.new(3,      'Hearts'),
  Card.new('Jack', 'Clubs'),
  Card.new(5,      'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Ace',      'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(10, 'Clubs')
]).best_hand_cards
puts
