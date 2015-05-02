class Piece
  attr_accessor :pos
  attr_reader :board, :color

  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end

  def render
    symbols[color]
  end

  def moves
    raise 'Not yet implemented'
  end

  def valid_moves
    valid_moves = []
    moves.reject do |end_pos|
      moves_into_check?(end_pos)
    end
  end

  def moves_into_check?(end_pos)
    test_board = board.dup(false)
    test_board.move_piece!(color, pos, end_pos)
    test_board.in_check?(color)
  end
end
