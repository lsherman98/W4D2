require_relative 'piece'
require_relative '../modules/slideable_module'

class Queen < Piece
  include Slideable

  def symbol
    '♛' #.colorize(color)
  end

  protected
  def move_dirs
    #return directions a queen can move
    #horizontal, vertical, and diagnol
    horizontal_and_vertical_dirs + diagonal_dirs
  end
end
