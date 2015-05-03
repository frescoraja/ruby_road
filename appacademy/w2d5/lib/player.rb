class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name, hand)
    @name = name
    @hand = hand
  end

  def get_card
    @hand.take_card
  end

  def show_hand
    puts "#{name}'s cards: "
    @hand.cards.each_with_index do |card, index|
      print "#{index +1}: " +
      "#{card.printable} of #{card.show_suit(card.suit)}".colorize(:black).colorize(:background => :white)
    end
    show_rank
    print "\n"
  end

  def show_rank
    if @hand.hand_rank > 1
      puts "You have a #{@hand.rank_in_words}!".colorize(:red)
    end
  end

  def reject_cards
    puts "#{name}, which cards do you want to exchange (1-5)? "
    cards = gets.chomp.split(",").map(&:to_i).sort
    bad_cards = cards.count
    until cards.empty?
      @hand.discard_card(cards.pop-1)
    end
    bad_cards.times do
      get_card
    end
    show_hand
  end
end


class Computer < Player


end
