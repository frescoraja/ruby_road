
class Hanoi

  def initialize(num)
    @num = num
    a1 = (1..num).to_a.reverse
    a2 = []
    a3 = []
    @stacks = [a1,a2,a3]
    @win_state = a1
  end

  def make_move(start_pos, end_pos)
      if valid_move?(start_pos, end_pos)
        @stacks[end_pos].push(@stacks[start_pos].pop)
      else
        print "Not valid move. Please try another move"
      end
  end

  def valid_move?(start_pos, end_pos)
    (0..2).to_a.include?(start_pos) && (0..2).to_a.include?(end_pos) && (!@stacks[start_pos].empty?) &&
    (@stacks[end_pos].empty? || @stacks[start_pos].last < @stacks[end_pos].last)

  end

  def over?
    if @stacks[1] == @win_state || @stacks[2] == @win_state
      display_towers
      print "GAME COMPLETED\n"
      true
    else
      false
    end
  end

  def user_input
    print "Which pile would you like to select a disc from?"
    n = gets.to_i
    print "Where would you like to put it?"
    m = gets.to_i
    make_move(n-1,m-1)
  end

def display_towers
    num = @num
    lines = []
    height = num
    for j in 0...height
      pieces = ""
      for i in 0..2
        if @stacks[i][j].nil?
          if i > 0
            pieces += (" " * (num+5)) + "|" + (" " * (num+5))
          elsif pieces == ''
            pieces += "|" + (" " * (num+4))
          end
        else
          if pieces == ""
            pieces += ("=" * @stacks[i][j]) + (" " * (num-@stacks[i][j] + 5))
          else
            pieces += (" " * (num+5)) + ("=" * @stacks[i][j]) + (" " * (num-@stacks[i][j]+6))
          end

        end
      end
      lines.unshift(pieces.reverse.rstrip.reverse) #Cuts off extra whitespace at the right
    end
    lines.unshift("")
    lines.unshift("")
    lines.each { |line| puts line }
    labels = "(1)" + (" " * (2*num+6)) + "(2)" + (" " * (2*num+8)) + "(3)"
    puts labels
end







  def run_game
    until over?
      display_towers
      user_input
    end
  end

end
print "Hello, how many discs do you want to play with?"
num = gets.to_i

Hanoi.new(num).run_game
