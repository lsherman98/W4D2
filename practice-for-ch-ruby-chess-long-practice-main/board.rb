require_relative "piece"

class Board

    def initialize
        @rows = Array.new(8) { Array.new(8) }
        self.initialize_pieces
    end 

    def [](pos)
        x, y = pos
        @rows[x][y]
    end 

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        if @board[start_pos] == nil
            raise "THERE IS NO PIECE AT START POSITION!!!"
        end
    end

    private

    def initialize_pieces
        rows.each_with_index do |row, row_i|
            row.each_index do |col_i|
                if row <= 1 || row >= 6 #where pieces occupy board
                    @rows[row_i][col_i] = Piece.new
                else
                    @rows[row_i][col_i] = nil
                end
            end
        end
    end

end