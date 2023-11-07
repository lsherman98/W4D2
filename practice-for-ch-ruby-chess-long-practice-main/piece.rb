class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        return self.symbol
    end

    def empty?
        @pos == nil
    end

    def valid_moves

    end

    def =(val)
        @pos = val
    end

    def symbol
        self.symbol
    end

    def move_into_check(end_pos)

    end

end
