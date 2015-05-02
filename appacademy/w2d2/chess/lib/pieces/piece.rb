class Piece
  attr_accessor :position

  def initialize(position, board, color)
    @pos = position
    @board = board
    @color = color
  end

  def move(new_pos)
    @moved = true if !@moved
    @board[@pos] = nil
    @board[new_pos] = self
    @pos = new_pos
  end


  def possible_moves
    raise "not yet implemented"
  end


  def valid_moves

  end

end
