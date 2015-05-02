require_relative 'piece'
class Pawn < Piece

  def symbols
    { white: "P", black: "p" }
  end

  def at_start_row?
    (color == :white && pos[0] == 6) ||
        (color == :black && pos[0] == 1)
  end
  #pos[0] == (color == :white ? 6 : 1)

  def moves
    straight_steps + diag_attacks
  end

  def straight_steps
    straight_moves = []
    cx, cy = pos
    dx, dy = [cx + forward_dir * 1, 0]
    straight_moves << [dx, dy] if board.empty?([dx, dy])
    dx += forward_dir
    if at_start_row? && board.empty?([dx, dy])
      straight_moves << [dx, dy]
    end
    straight_moves
  end

  def diag_attacks
    diag_attacks = []
    cx, cy = pos
    dx = cx + forward_dir
    [-1 , 1].each do |dy|
      if !board[[dx, dy]].nil? && board[[dx, dy]].color != color
        diag_attacks << [dx, dy]
      end
    end
    diag_attacks
  end

  def forward_dir
    color == :black ? -1 : 1
  end
end
