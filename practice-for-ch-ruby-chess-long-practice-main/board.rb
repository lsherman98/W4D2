require_relative "piece"

class Board
    attr_reader :rows
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
        #make sure to edit piece position after moving
        x, y = end_pos
        raise "THERE IS NO PIECE AT START POSITION!!!" if self[start_pos] == nil
        raise "NOT VALID POSITION, OUT OF BOUNDS!!!!" if (x < 0 || x > 7) || (y < 0 || y > 7)
    end

    private

    def initialize_pieces
        @rows.each_with_index do |row, row_i|
            row.each_index do |col_i|
                if row_i <= 1 || row_i >= 6 #where pieces occupy board
                    @rows[row_i][col_i] = Piece.new
                else
                    @rows[row_i][col_i] = nil
                end
            end
        end
    end

end
