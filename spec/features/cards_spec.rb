require 'spec_helper'
require 'cards'
# http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html
# http://stackoverflow.com/questions/22970627/raise-argumenterror-ruby

describe 'Creating a card' do
  it 'with a particular suit and rank' do
    card = Card.new('Hearts', '12')
    card.suit.must_match('hearts')
    card.rank.must_match('queen')
  end

  it 'with valid rank returns correct value' do
    card = Card.new('Diamonds', '9')
    card.suit.must_match('diamonds')
    card.rank.must_match('9')
  end

  it 'returns error message with invalid suit' do
    assert_raises ArgumentError do
      Card.new('Coins', '10')
    end
  end

  it 'returns error message with invalid rank' do
    assert_raises ArgumentError do
      Card.new('clubs', '20')
    end
  end
end
