require_relative 'piece'
require_relative '../modules/slideable_module.rb'

class Bishop < Piece
  include Slideable

  def symbol
    '♝' #.colorize(color)
  end

  protected

  def move_dirs
    diagonal_dirs
  end
end
