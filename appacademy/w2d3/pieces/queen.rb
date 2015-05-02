require_relative 'piece'
require_relative 'sliders'
class Queen < Piece
  include Sliders

  def symbols
    { white: "Q", black: "q" }
  end

  def move_dirs
    diag_moves + straight_moves
  end

end
