require_relative 'piece'
require_relative 'steppers'
class King < Piece
  include Steppers

  MOVE_DELTAS = [
    [ 1 , 0],
    [ 1 , 1],
    [ 1 ,-1],
    [-1 ,-1],
    [-1 , 1],
    [-1 , 0],
    [ 0 ,-1],
    [ 0 , 1]
  ]

  def symbols
    { white: "K", black: "k" }
  end

  def move_dirs
    MOVE_DELTAS
  end
end
