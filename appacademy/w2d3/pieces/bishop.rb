require_relative 'piece'
require_relative 'sliders'
class Bishop < Piece
  include Sliders

  def symbols
    { white: "B", black: "b" }
  end

  def move_dirs
    diag_moves
  end

end
