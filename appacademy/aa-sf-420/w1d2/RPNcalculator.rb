class RPNcalculator
  OPERATORS = ['+','*','/','-']
  attr_accessor :to_bucket, :user_terms

  def initialize
    @to_bucket = []
    # @user_term = nil -- don't need this
  end

  def run
    original_bucket = ARGV.empty? ? input_terms : use_file(ARGV[0])
    calculate(original_bucket)
  end

  def calculate(from_bucket)
    until from_bucket.size == 0
      temp_term = from_bucket.shift
      temp_term = OPERATORS.include?(temp_term) ? temp_term.to_sym : temp_term.to_i
      if temp_term.is_a?(Integer)
        to_bucket << temp_term
      elsif temp_term.is_a?(Symbol) && to_bucket.last.is_a?(Integer) && to_bucket[-2].is_a?(Integer)
        to_bucket << pop_two.reduce(temp_term)
      else
        puts "Invalid equation"
        break
      end
    end
    to_bucket.first
  end

  private

  def pop_two
    first_number = to_bucket.pop
    second_number = to_bucket.pop
    [second_number, first_number]
  end

  def input_terms
    terms = []
    loop do
      user_term = gets.chomp
      break if user_term == "q"
      terms << user_term
    end
    terms
  end

  def use_file(file_name)
    File.read(file_name).split(' ')
  end
end

if __FILE__ == $PROGRAM_NAME
  calculator = RPNcalculator.new
  p calculator.run
end
