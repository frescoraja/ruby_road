require_relative 'pieces/piece'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/stepable'
require_relative 'pieces/slideable'

class Pieces
  attr_reader :board, :symbol
  attr_accessor :position

  def initialize(board, symbol, position)
    raise "invalid position." unless board.valid_position?(pos)
    raise "invalid symbol." unless [:white, :black].include?(symbol)

    @board, @symbol, @position = board, symbol, position
    @board.add_piece(self, position)
  end

  # def valid_moves
  #
  # end
  #
  # def move_into_check?(to_pos)
  #
  # end

end
