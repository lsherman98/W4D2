require_relative "piece"

class Board
    attr_reader :rows
    def initialize(fill_board = true)

        make_starting_grid(fill_board)
    end

    def [](pos)
        raise 'invalid position' unless valid_position?(pos)

        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        raise 'invalid position' unless valid_position?(pos)

        row, col = pos
        @rows[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        #make sure to edit piece position after moving
        raise "Position is not empty" unless empty?(start_pos)
        raise 'invalid position' unless valid_position?(end_pos)
    end

    private

    def empty?(pos)
        self[pos].empty?
    end

    def valid_position?(pos)
        pos.all? {|coordinate| coordinate.between?(0,7)}
    end

    def make_starting_grid(fill_board)
        @rows = Array.new(8) { Array.new(8) {nil} }
        return unless fill_board
        [:white, :black].each do |color|
            fill_back_row(color)
            fill_front_row(color)
        end

    end

    def fill_back_row(color)
        back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece, j|
            @rows[[i, j]] = piece.new(color, self, [i, j])

        end
    end

    def fill_front_row(color)
        front_pieces = [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn]
        i = color == :white ? 6 : 1
        front_pieces.each_with_index do |piece, j|
            @rows[[i, j]] = piece.new(color, self, [i, j])
        end
    end

end
