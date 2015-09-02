# Create cards and check to see if it's valid.
class Card
  attr_accessor :suit, :rank
  SUITS = %w(clubs diamonds hearts spades)
  RANKS = { '11' => 'jack', '12' => 'queen', '13' => 'king' }

  def initialize(suit, rank)
    if Card.valid_suit?(suit) && rank = Card.valid_rank?(rank)
      @suit = suit.downcase
      @rank = rank
    else
      fail(ArgumentError, "Suit and Rank must both be valid")
    end
  end

  private

  def self.valid_suit?(suit)
    SUITS.include?(suit.downcase)
  end

  def self.valid_rank?(rank)
    if RANKS.include?(rank)
      return RANKS[rank]
    elsif (1..10).to_a.include?(rank.to_i)
      return rank
    end
    nil
  end
end

# Resources:
# http://stackoverflow.com/questions/22970627/raise-argumenterror-ruby
