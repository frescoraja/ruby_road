# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def symbols
    { white: 'R', black: 'r' }
  end
  
  def directions
    straightmoves
  end
end
