class Game
  MAXIMUM_TURNS = 6
  def initialize(player1, player2)
    @guessing_player = player1
    @checking_player = player2
    @wrong_guesses = 0
  end

  def run
    @secret_word = @checking_player.pick_secret_word
    length = @checking_player.receive_word_length
    @game_state = '_' * length
    until won? || @wrong_guesses >= MAXIMUM_TURNS
      puts "Secret word: #{@game_state}"
      guess = @guessing_player.guess[0]
      if @checking_player.correct_guess?(guess)
        matched_at = @checking_player.handle_guess_response(guess)
        change_game_state(matched_at, guess)
      else
        @wrong_guesses += 1
      end
    end
    end_game
  end

  def end_game
    puts "#{@game_state}"
    if @wrong_guesses > 5
      puts "GAME OVER #{@guessing_player.class}"
      puts "The word was #{@secret_word}"
    else
      puts "#{@guessing_player.class} WINS!"
    end
  end

  def change_game_state(matched_at, guess)
    matched_at.each do |index|
      @game_state[index] = guess
    end
  end

  def won?
    !@game_state.include?("_")
  end
end

class Computerplayer
  attr_reader :secret_word

  def initialize
    @words = File.readlines("dictionary.txt").map(&:chomp)
    @random_guesses = ('a'..'z').to_a.shuffle
  end

  def pick_secret_word
    @secret_word = @words.sample
  end

  def receive_word_length
    @secret_word.length
  end

  def guess
    @random_guesses.pop
  end

  def correct_guess?(guess)
    @secret_word.include?(guess)
  end

  def handle_guess_response(guess)
    start = 0
    index_of_matches = []
    while start < @secret_word.length
      index_of_matches << start if @secret_word[start] == guess
      start += 1
    end
    index_of_matches
  end
end

class Humanplayer
  def pick_secret_word
    puts "Come up with a word for me to guess..."
  end

  def receive_word_length
    print "What is the length of your word?"
    Integer(gets)
  end

  def guess
    gets.chomp
  end

  def valid_input?(answer)
    answer == 'y' || answer == 'n'
  end

  def correct_guess?(guess)
    print "Does '#{guess}' appear in your word? (y/n):"
    answer = gets.chomp.downcase
    until valid_input?(answer)
      print "Not a valid answer, try again (y/n):"
      answer = gets.chomp.downcase
    end
    answer == 'y' ? true : false
  end

  def handle_guess_response(guess)
    puts "Where can I put '#{guess}'?"
    input = gets.chomp.split(",").select { |x| x =~ /\d/ }
    input.map! { |num| num.to_i }
    input.map! { |num| num-1 }
  end
end

hangman = Game.new(Humanplayer.new,Computerplayer.new).run
