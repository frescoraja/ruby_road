require_relative 'pieces'
require 'byebug'
class Board

  def initialize(fill_board = true)
    make_blank_board(fill_board)
  end

  def [](pos)
    raise "Not a valid position." unless valid_position?(pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, piece)
    raise "Not a valid position." unless valid_position?(pos)
    x, y = pos
    @rows[x][y]= piece
  end

  def add_piece(piece, pos)
    raise "Not an empty spot" unless position_empty?(pos)
    self[pos] = piece
  end

  def dup
    new_board = Board.new(false)
    new_board.pieces.each do |piece|
      piece.class.new(new_board, piece.symbol, piece.position)
    end
  end

  def in_check?(color)
    king_pos = find_king(color).position
    pieces.any? { |piece| piece.moves.include?(king_pos) }
  end

  def check_mate?

  end

  def find_king(color)
    king = pieces.find do |piece|
      piece.is_a?(King) && piece.color == color
    end
  end

  def pieces
    @rows.flatten.compact
  end

  def position_empty?(pos)
    self[pos].nil?
  end

  def fill_back_rows(symbol)
    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    row = symbol == :white ? 0 : 7
    back_pieces.each_with_index do |piece, col|
      piece.new(self, symbol, [row, col])
    end
  end

  def fill_in_pawns(symbol)
    row = symbol == :white ? 1 : 6
    8.times do |col|
      Pawn.new(self, symbol, [row, col])
    end
  end

  def make_blank_board(fill_board)
    @rows = Array.new (8) { Array.new(8) }
    return if fill_board
    [:white, :black].each do |symbol|
      @rows.fill_in_pawns(symbol)
      @rows.fill_back_rows(symbol)
    end
  end

  def valid_position?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

end
