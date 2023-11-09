

class Piece
    attr_accessor :pos
    attr_reader :color, :board
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    # def to_s
    #     self.symbol.to_s
    # end

    def empty?
        false
    end

    # def valid_moves()

    # end

    def symbol
        self.symbol
    end

    def move_into_check(end_pos)

    end

end
