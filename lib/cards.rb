# Create deck and check cards for uniqueness.
class Deck
  attr_accessor :deck, :message
  def initialize
    @deck = []
    @message = nil
  end

  def add_card(card)
    if check_unique(card) == false
      @message = 'Card not added to deck.'
    else
      @deck << card
      @message = 'Card added to deck.'
    end
  end

  def check_unique(card)
    if @deck.count do |obj|
         obj.suit == card.suit && obj.rank == card.rank
       end != 0
      return false
    else
      return true
    end
  end
end

# Create cards and check to see if it's valid.
class Card
  attr_accessor :suit, :rank, :message
  SUITS = %w(clubs diamonds hearts spades)
  RANKS = { '11' => 'jack', '12' => 'queen', '13' => 'king' }

  def initialize(suit, rank)
    if Card.check_suit(suit.downcase) == true
      @suit = suit.downcase
    else
      return @message = 'Invalid suit.'
    end
    if !Card.check_rank(rank).nil?
      @rank = Card.check_rank(rank)
    else
      return @message = 'Invalid rank.'
    end
  end

  def self.check_suit(suit)
    SUITS.include?(suit) ? true : false
  end

  def self.check_rank(rank)
    if RANKS.include?(rank)
      return RANKS[rank]
    elsif (1..10).to_a.include?(rank.to_i)
      return rank
    end
    nil
  end
end
