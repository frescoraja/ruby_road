# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def symbols
    { white: 'B', black: 'b'}
  end

  def directions
    diagmoves
  end
end
