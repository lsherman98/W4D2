require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
  end

  def symbol
    'X'
  end

  def color
    @color
  end

  def moves
    []  
  end
end
