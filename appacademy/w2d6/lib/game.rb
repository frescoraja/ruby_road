require_relative 'card'
require_relative 'dealer'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class Game

  def initialize(dealer, *players)
    @dealer = dealer
    @players = players
    @deck = Deck.new
    10.times do
      @deck.shuffle!
    end
  end

  def play_round
    playing = true
    while playing == true
      deal_hands!
      @players.each do |player|
        player.give_bet(@dealer)
        next unless player.hit?(@deck)
      end
      puts "#{@dealer.name}'s cards:"
      puts "#{@dealer.hand.to_s}"
      @dealer.play_hand(@deck)
      puts "#{@dealer.hand.to_s}"
      @dealer.pay_bets
      print "Do you want to play another hand? (y/n)"
      yesno = gets.chomp
      if yesno == 'y'
        playing = true
      else
        playing = false
      end
    end
  end

  private

  def deal_hands!
    @players.each do |player|
      player.hand = Hand.deal_from(@deck)
    end
    @dealer.hand = Hand.deal_from(@deck)
  end
end


if __FILE__ == $PROGRAM_NAME
  Game.new(Dealer.new, Player.new("David", 200_000), Player.new("Greg", 200_000)).play_round
end
