require_relative 'hand'
require_relative 'player'
require_relative 'deck'
require_relative 'card'
require 'byebug'
require 'colorize'

class Game

  def initialize(num)
    @number_of_players = num
    @players = []
    @deck = Deck.new
    create_players
  end

  def play
    system 'clear'
    5.times do
      @deck.shuffle_cards!
    end
    deal_first_hand
    @players.each do |player|
      player.show_hand
    end
    @players.each do |player|
      player.reject_cards
    end

    tie = false
    winner = @players.first
    @players.each do |player|
      (1...@number_of_players).each do |num|
        next if player == @players[num]
        case player.hand <=> @players[num].hand
        when 1
          winner = player
        when -1
          winner = @players[num]
        when 0
          tie = true
        end
      end
    end
    unless tie
      puts "#{winner.name} Wins with their #{winner.hand.rank_in_words}"
    else
      puts "It's a draw!"
    end
  end

  def deal_first_hand
    (@number_of_players * 5).times do
      # debugger
      @players.first.get_card
      @players.rotate!
    end
  end

  def create_players

    (1..@number_of_players).each do |num|
      @players << Player.new("Player#{num}", Hand.new(@deck))
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new(2).play
end
