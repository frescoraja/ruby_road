class Board

  attr_reader :grid

  def self.blank_grid
    Array.new(3) { Array.new(3) }
  end

  def initialize(rows = self.class.blank_grid)
    @grid = rows
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end

  def won?
    #winning logic
  end

  def empty?(pos)
    self[*pos] == nil
  end

  def winner

  end

  def place_mark(pos,mark)
    self[*pos] = mark if self.empty?(pos)
  end

  def show
    p grid[0]
    p grid[1]
    p grid[2]
  end

end

class HumanPlayer
  attr_reader :mark,

end

class ComputerPlayer

end

class Game


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new

  end

  def play
    until @board.won? do
			
    end
  end
end
