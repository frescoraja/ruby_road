class Hangman
  def initialize(player1, player2)
    @guessing_player = player1
    @checking_player = player2
    @wrong_guess = 0
    @index_of_matches = []
  end

  def won?
    @game_state == @secret_word
  end

  def change_game_state(matches)
    matches.each do |index|
      @game_state[index] = @secret_word[index]
    end
  end

  # def get_length
  #   @secret_word = @checking_player.pick_secret_word
  #   if @secret_word.is_a?(String)
  #     @length = @secret_word.length
  #   elsif @secret_word.is_a?(Integer)
  #     @length = @secret_word
  #   end
  # end

  def run
    @length = @checking_player.receive_secret_length
    p @secret_word
    @game_state = '_' * @length
    until won? || @wrong_guess > 5
      puts "Secret word: #{@game_state}"
      current_guess = @guessing_player.guess
      if @checking_player.correct_guess?(current_guess)
        puts "#{@checking_player.handle_guess_response(current_guess)} current"
        puts "#{@index_of_matches} total list"
        @index_of_matches.concat(@checking_player.handle_guess_response(current_guess))
        change_game_state(@index_of_matches)
      else
        @wrong_guess += 1
      end
    end
  end
end

class Humanplayer

  def initialize

  end

  def pick_secret_word
    puts "What is the length of your word?"
    Integer(gets)
  end

  def receive_secret_length
    pick_secret_word
  end

  def guess
    gets.chomp
  end

  def correct_guess?(guess)
    puts "The other player's guess was: #{guess}"
    puts "Does #{guess} appear in your word? (y/n):"
    answer = gets.chomp.downcase
    if answer == 'y'
      true
    elsif answer == 'n'
      false
    end
  end

  def handle_guess_response(guess)
    input = gets.chomp.split(",").select { |x| x =~ /[0..9]/ }
    input.map! { |num| num.to_i }
  end
end

class Computerplayer

  def initialize
    @words = File.readlines("dictionary.txt").map { |line| line.chomp }
    @random_guesses = ('a'..'z').to_a.shuffle
  end

  def pick_secret_word
    @secret_word = @words.sample
  end

  def receive_secret_length
    @secret_word = @checking_player.pick_secret_word
    if @secret_word.is_a?(String)
      @length = @secret_word.length
    elsif @secret_word.is_a?(Integer)
      @length = @secret_word
    end
  end

  def guess
    @random_guesses.pop
  end

  def correct_guess?(guess)
    @secret_word.include?(guess)
  end

  def handle_guess_response(guess)
    index_of_matches = []
    start = 0
    while start < @secret_word.length
      if @secret_word[start] == guess
        index_of_matches << start
      end
      start += 1
    end
    index_of_matches
  end
end

bob = Humanplayer.new
apple = Computerplayer.new
game = Hangman.new(apple,bob)
game.run
