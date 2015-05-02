module Steppers

  def moves
    moves = []
    move_dirs.each do |dir|
      moves << dir if board.empty?(dir) || board[dir].color != color
    end
    moves
  end
end
