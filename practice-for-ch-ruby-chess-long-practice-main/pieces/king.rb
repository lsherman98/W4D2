require_relative 'piece'
require_relative '../modules/stepable'

class King < Piece
include Stepable

  def symbol
    '♚' #.colorize(color)
  end

  protected

  def move_dirs
    [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0],
      [1, 1],
      [-1, -1],
      [-1, 1],
      [1, -1]
    ]
  end

end
