module Sliders
  DIAG_MOVES = [
    [ 1 , 1],
    [ 1 ,-1],
    [-1 , 1],
    [-1, -1]
  ]

  STRAIGHT_MOVES = [
    [ 0 , 1],
    [ 0 ,-1],
    [ 1 , 0],
    [-1 , 0],
  ]

  def diag_moves
    DIAG_MOVES
  end

  def straight_moves
    STRAIGHT_MOVES
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(slide(dx, dy))
    end
    moves
  end

  def slide(dx ,dy)
    cx, cy = pos
    moves = []
    loop do
      new_pos = [cx + dx, cy + dy]
      break if !valid_pos(new_pos)

      if board.empty?(pos)
        moves << [new_pos]
      else
        if board[new_pos].color != color
          moves << [new_pos]
          break
        end
      end
    end
    moves
  end
end
