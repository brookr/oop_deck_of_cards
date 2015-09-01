require 'spec_helper'
require 'cards'
# http://chriskottom.com/blog/2014/10/4-fantastic-ways-to-set-up-state-in-minitest/

describe 'Adding card to deck' do
  before do
    @new_deck = Deck.new
    @card = Card.new('Hearts', '12')
  end

  it 'increases deck size by 1' do
    @new_deck.add_card(@card)
    @new_deck.message.must_match('Card added to deck.')
    assert_equal 1, @new_deck.deck.length
  end

  it 'when card already exists will not add to deck' do
    @new_deck.add_card(@card)
    card2 = Card.new('Hearts', '12')
    size = @new_deck.deck.length
    @new_deck.add_card(card2)
    @new_deck.message.must_match('Card not added to deck.')
    assert_equal size, @new_deck.deck.length
  end
end
