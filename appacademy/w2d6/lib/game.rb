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
      system 'clear'
      deal_hands!
      @players.each do |player|
        get_bet(player)
        next unless hit?(player)
      end
      puts "#{@dealer.name}'s cards:"
      puts "#{@dealer.hand.to_s}"
      @dealer.play_hand(@deck)
      if @dealer.hand.busted?
        puts "#{@dealer.name} busted!"
      end
      @dealer.pay_bets
      @players.each do |player|
        if player.hand.beats?(@dealer.hand)
          puts "#{player.name}, you won!"
          puts "You now have #{player.bankroll}"
        else
          puts "#{player.name}, you lost!"
          puts "You now have #{player.bankroll}"
        end
      end
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

  def get_bet(player)
    puts "#{player.name}, your cards are :"
    puts "#{player.hand.to_s}"
    print "You have $#{player.bankroll}. How much do you want to bet? "
    bet = Integer(gets.chomp)
    player.place_bet(@dealer, bet)
  end

  def hit?(player)
    answer = true
    while answer && !player.hand.busted?
      print "Do you want to hit? (y/n):"
      yesno = gets.chomp
      answer = yesno == 'y' ? true : false
      break if answer == false
      player.hand.hit(@deck)
      puts "#{player.name}, your cards are now:"
      puts "#{player.hand.to_s}"
      if player.hand.busted?
        puts "You Busted!"
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  Game.new(Dealer.new, Player.new("David", 200_000), Player.new("Greg", 200_000)).play_round
end
