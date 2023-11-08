require_relative 'piece'
require_relative 'stepable'

class King < Piece
include Stepable

def symbol

end

def move_diffs
  #return possible moves
end

end
