require "spec_helper"
require "cards"
#http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html

describe "Creating a card" do
  it "with a particular suit and rank" do
    card = Card.new( "Hearts", "12" )
    card.suit.must_match( "hearts" )
    card.rank.must_match( "queen" )
  end

  it "with valid rank returns correct value" do
    card = Card.new( "Diamonds", "9" )
    card.suit.must_match( "diamonds" )
    card.rank.must_match( "9" )
  end

  it "returns error message with invalid suit" do
    card = Card.new( "Coins", "10" )
    card.message.must_match( "Invalid suit." )
  end

  it "returns error message with invalid rank" do
    card = Card.new( "clubs", "20" )
    card.message.must_match( "Invalid rank." )
  end

  it "with invalid params does not add to deck" do
    card = Card.new( "Coins", "10" )
    card.message.wont_match( "Card added to deck." )
    card.message.must_match( "Invalid suit." )
  end
end
