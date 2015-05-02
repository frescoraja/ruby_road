require_relative 'piece'
require_relative 'sliders'
class Rook < Piece
  include Sliders

  def symbols
    { white: "R", black: "r" }
  end

  def move_dirs
    straight_moves
  end
end
