class Deck
  attr_accessor :deck, :message
  def initialize
    @deck = []
    @message = nil
  end

  def add_card(card)
    unless self.check_deck(card) == true
      @deck << card
      @message = "Card added to deck."
    else
      @message = "Card not added to deck."
    end
  end

  def check_deck(card)
    if @deck.length == 52 || self.check_unique(card) == true
      return true
    else
      return false
    end
  end

  def check_unique(card)
    if @deck.select { |obj| obj.suit == card.suit && obj.rank == card.rank }.length != 0
      return true
    else
      return false
    end
  end
end

class Card
  attr_accessor :suit, :rank, :message
  @@suits = [ "clubs", "diamonds", "hearts", "spades" ]
  @@ranks = { "11" => "jack", "12" => "queen", "13" => "king" }

  def initialize(suit, rank)
    @message = nil
    if Card.check_suit(suit.downcase) == true
      @suit = suit.downcase
    else
      return @message = "Invalid suit."
    end
    if Card.check_rank(rank) != nil
      @rank = Card.check_rank(rank)
    else
      return @message = "Invalid rank."
    end
  end

  def self.check_suit(suit)
    @@suits.include?(suit) ? true : false
  end

  def self.check_rank(rank)
    if @@ranks.include?(rank)
      return @@ranks[rank]
    elsif (1..10).to_a.include?(rank.to_i)
      return rank
    end
    nil
  end
end

new_deck = Deck.new
card = Card.new( "hearts", "12" )
new_deck.add_card(card)
p new_deck.message
card2 = Card.new( "hearts", "12" )
new_deck.add_card(card2)
p new_deck.message
p new_deck.deck
