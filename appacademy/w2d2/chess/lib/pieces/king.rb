# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  def symbol
    { white: 'K', black: 'k'}
  end

  def directions
    [
      [-1,  0],
      [-1, -1],
      [-1,  1],
      [ 0, -1],
      [ 0,  1],
      [ 1,  0],
      [ 1,  1],
      [ 1, -1],
    ]
  end

end
