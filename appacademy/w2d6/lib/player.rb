class Player
  attr_reader :name
  attr_accessor :hand, :bankroll

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end

  def pay_winnings(bet_amt)
    @bankroll += bet_amt
  end

  def return_cards(deck)
    hand.return_cards(deck)
    self.hand = nil
  end

  def place_bet(dealer, bet_amt)
    raise "player can't cover bet" if bet_amt > @bankroll
    dealer.take_bet(self, bet_amt)
    @bankroll -= bet_amt
  end

  def give_bet(dealer)
    puts "#{@name}, your cards are :"
    puts "#{hand.to_s}"
    print "You have $#{@bankroll}. How much do you want to bet? "
    bet = Integer(gets.chomp)
    place_bet(dealer, bet)
  end

  def hit?(deck)
    answer = true
    while answer && !hand.busted?
      print "Do you want to hit? (y/n):"
      yesno = gets.chomp
      answer = yesno == 'y' ? true : false
      break if answer == false
      hand.hit(deck)
      print "#{hand.to_s}"
      if hand.busted?
        puts "You Busted!"
      end
    end
  end

end
