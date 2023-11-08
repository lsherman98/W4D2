require_relative "./pieces/piece"
require_relative "./pieces/pawn"
require_relative "./pieces/null_piece"
require_relative "./pieces/bishop"
require_relative "./pieces/king"
require_relative "./pieces/knight"
require_relative "./pieces/rook"
require_relative "./pieces/queen"


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
        raise "Position is not empty" unless empty?(end_pos)
        raise 'invalid position' unless valid_position?(end_pos)
        #the current piece that we want to move, will be set to end_pos

        piece_to_move = self[start_pos]
        if piece_to_move.moves.include?(end_pos)
            self[end_pos] = piece_to_move
            self[start_pos] = NullPiece.instance
        else
            p piece_to_move.moves.include?(end_pos)
            p piece_to_move.moves
            raise "cant do that buddy"
        end
    end

    def print_board
        @rows.each do |row|
            puts row.map {|piece| piece.symbol.to_s}.join('')
        end
    end

     def valid_position?(pos)
        pos.all? {|coordinate| coordinate.between?(0,7)}
    end


    def empty?(pos)
        self[pos] == NullPiece.instance
    end


    private
    def make_starting_grid(fill_board)
        @rows = Array.new(8) { Array.new(8) {NullPiece.instance} }
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
           self[[i, j]] = piece.new(color, self, [i, j])

        end
    end

    def fill_front_row(color)
        front_pieces = [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn]
        i = color == :white ? 6 : 1
        front_pieces.each_with_index do |piece, j|
            self[[i, j]] = piece.new(color, self, [i, j])
        end
    end

end
