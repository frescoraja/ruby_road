class GuessingGame
  attr_accessor :user_guess

  def initialize
    @computer_number = rand(1..100)
    # @user_guess = nil
  end

  def play
    until user_guess == @computer_number
      get_guess
      result = check_guess
      puts "Your guess was #{result}"
    end
  end

  def get_guess
    puts "What number would you like to guess?: "
    self.user_guess = Integer(gets)
  end

  def check_guess
    case user_guess <=> @computer_number
    when -1
      return "too low"
    when 0
      return "correct"
    when 1
      return "too high"
    end
  end
end
