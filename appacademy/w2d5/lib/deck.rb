require_relative 'card'

class Deck

  attr_accessor :cards

  SUITS = [:s, :d, :c, :h]

  def initialize
    @cards = []
    generate_cards
  end

  def take_one
    @cards.pop
  end

  def count
    @cards.count
  end

  def shuffle_cards!
    left = @cards.take(count/2)
    right = @cards.drop(count/2)

    shuffled = []
    until left.empty? && right.empty?
      shuffled << left.shift(rand(4))
      shuffled << right.shift(rand(4))
    end

    @cards = shuffled.flatten
  end

  private
  def generate_cards
    (2..14).each { |val| SUITS.each { |suit| @cards << Card.new(val, suit) } }
  end
end
