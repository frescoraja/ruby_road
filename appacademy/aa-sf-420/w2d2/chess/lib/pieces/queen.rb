# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbols
    { white: 'Q', black: 'q'}
  end

  protected
  def directions
    straightmoves + diagmoves
  end

end
