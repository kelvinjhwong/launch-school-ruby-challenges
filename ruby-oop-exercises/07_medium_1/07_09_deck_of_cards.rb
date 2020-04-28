class Card
  # include Comparable
  
  # CARDS_IN_ORDER = (2..10).to_a + %w(Jack Queen King Ace)
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
  
  # def <=>(other_card)
  #   CARDS_IN_ORDER.index(rank) <=> CARDS_IN_ORDER.index(other_card.rank)
  # end
  
  def ==(other_card)
    to_s == other_card.to_s
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
# puts drawn
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
# puts drawn2
p drawn != drawn2 # Almost always.
