require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("Dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until self.hand.points >= 17
      puts "Dealer hits!"
      self.hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, amt|
      if player.hand.beats?(self.hand)
        puts "#{player.name}, you won! #{amt * 2}"
        player.pay_winnings(amt * 2)
        puts "You now have #{player.bankroll}"
      else
        puts "#{player.name}, you lost!"
        puts "You now have #{player.bankroll}"
      end
    end
  end
end
