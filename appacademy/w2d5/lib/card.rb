class Card

  SUITS = {
    :h => '♡',
    :d => '♢',
    :c => '♧',
    :s => '♤'
  }

  VALUES = [
    'J', 'Q', 'K', 'A'
]

  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def show_suit(symbol)
    SUITS[symbol]
  end

  def printable
    return "#{@value}" if @value < 11
    VALUES[@value % 11]
  end
end
