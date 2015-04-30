# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'

def Knight < Piece
  include Stepable

  def symbol
    { white: 'H', black: 'h'}
  end

  def directions
    [
      [ 1,  2],
      [ 1, -2],
      [ 2, -1],
      [ 2,  1],
      [-2,  1],
      [-2, -1],
      [-1,  2],
      [-1, -2],
    ]
  end
