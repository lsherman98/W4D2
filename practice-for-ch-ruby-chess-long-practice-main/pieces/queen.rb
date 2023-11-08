require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable

  def symbol
    ''.colorize(color)
  end

  def move_dirs
    #return directions a queen can move
    #horizontal, vertical, and diagnol
    horizontal__and_vertical_dirs + diagonal_dirs
  end
end
