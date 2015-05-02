require_relative 'piece'
require_relative 'steppers'
class Knight < Piece
  include Steppers

  MOVE_DELTAS = [
    [ 1 , 2],
    [-1 , 2],
    [-1 , 2],
    [ 1 ,-2],
    [ 2, -1],
    [ 2,  1],
    [-2 , 1],
    [-2 ,-1]
  ]
  def symbols
    { white: 'H' , black: 'h' }
  end

  def move_dirs
    MOVE_DELTAS
  end
end
