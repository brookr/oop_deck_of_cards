# Create deck and check cards for uniqueness.
class Deck
  attr_accessor :deck
  def initialize
    @deck = []
  end

  def add_card(card)
    if check_unique(card) == false
      fail(ArgumentError)
    else
      @deck << card
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
