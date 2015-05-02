require_relative 'pieces'

class Board

  def initialize(fill_board = true)
    make_starting_grid(fill_board)
  end

  def [](pos)
    raise "invalid pos" unless valid_pos?(pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    raise "invalid pos" unless valid_pos?(pos)
    row, col = pos
    @rows[row][col] = piece
  end

  def in_check?(color)
    king_pos = find_king(color)
    pieces.any? do |piece|
      piece.color != color && piece.moves.include?(king_pos)
    end
  end

  def checkmate?(color)
    return false unless in_check?(color)
    pieces.select { |piece| piece.color == color }.all? do |piece|
      piece.valid_moves?.empty?
    end
  end

  def empty?(pos)
    self[pos] == nil
  end

  def find_king(color)
    king_pos = @rows.flatten.find { |piece| piece.is_a?(King) && piece.color == color }
    king_pos ||= (raise "King not found")
  end

  def move_piece(turn_color, start_pos, end_pos)
    raise "No piece in start position" if empty?(start_pos)
    piece = self[start_pos]
    raise "Not your piece" unless piece.color == turn_color
    if !piece.moves.include?(end_pos)
      raise "Piece can't move there"
    elsif !piece.valid_moves.include?(end_pos)
      raise "Can't put your King in Check!"
    end

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise "Not a valid move for that piece" unless piece.valid_moves.include?(end_pos)
    self[end_pos], self[start_pos] = self[start_pos], nil
    self.pos = end_pos

    nil
  end

  def dup
    new_board = Board.new(false)
    pieces.each do |piece|
      new_board[piece.pos] = piece.class.new(piece.color, new_board, piece.pos)
    end

    new_board
  end

  def add_piece(piece, pos)
    raise "invalid pos" unless valid_pos?(pos)
    self[pos] = piece
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def pieces
    @rows.flatten.compact
  end

  def fill_back_row(color)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    row = color == :white ? 7 : 0
    pieces.each_with_index do |piece_class, col|
      piece_class.new(color, self, [row, col])
    end
  end

  def fill_pawns_row(color)
    row = color == :white ? 6 : 1
    8.times do |col|
      Pawn.new(color, self, [row, col])
    end
  end

  def make_starting_grid(fill_board)
    @rows = Array.new(8) { Array.new (8) }
    return unless fill_board
    [:white, :black].each do |color|
      fill_pawns_row(color)
      fill_back_row(color)
    end
  end

  # def render
  #
  #   @rows.each do |row|
  #     row.each do |col|
  #       if empty?([row, col])
  #         print " __ "
  #       else
  #         piece.render
  #       end
  #     end
  #     print "\n"
  #   end
  # end
  def render
    @rows.map do |row|
      row.map do |piece|
        piece.nil? ? '.' : piece.render
      end.join
    end.join("\n")
  end

end
