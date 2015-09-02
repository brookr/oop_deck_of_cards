require 'spec_helper'
require 'cards'
# http://chriskottom.com/blog/2014/10/4-fantastic-ways-to-set-up-state-in-minitest/
# http://stackoverflow.com/questions/22970627/raise-argumenterror-ruby

describe 'Adding card to deck' do
  before do
    @new_deck = Deck.new
    @card = Card.new('Hearts', '12')
  end

  it 'increases deck size by 1' do
    @new_deck.add_card(@card)
    assert_equal 1, @new_deck.deck.length
  end

  it 'when card already exists will not add to deck' do
    @new_deck.add_card(@card)
    card2 = Card.new('Hearts', '12')
    size = @new_deck.deck.length
    assert_raises ArgumentError do
      @new_deck.add_card(card2)
    end
  end
end
