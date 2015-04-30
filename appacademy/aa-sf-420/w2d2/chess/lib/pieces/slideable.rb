module Slideable

  STRAIGHTMOVES = [
    [0,  1],
    [1,  0],
    [0, -1],
    [-1, 0]
    ]

  DIAGMOVES = [
    [1,   1],
    [-1,  1],
    [1,  -1],
    [-1, -1],
  ]

  def moves
    moves = []
    directions.each do |dir|
      moves.concat(slide_in_dir(dir[0], dir[1]))
    end

    moves
  end

  def slide_in_dir(dx, dy)
    cur_x, cur_y = position
    moves = []

    loop do
      cur_x, cur_y = cur_x + dx, cur_y + dy
      pos = [cur_x, cur_y]

      break unless board.valid_position?(pos)

      if board.position_empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != color

        break
      end
    end

    moves
  end

  def straightmoves
    STRAIGHTMOVES
  end

  def diagmoves
    DIAGMOVES
  end

end
