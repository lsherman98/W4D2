module Slideable

    HORIZONTAL_AND_VERTICAL_DIRS = [
        [0, 1],
        [0, -1],
        [1, 0],
        [-1, 0]
].freeze
    DIAGONAL_DIRS = [
        [1, 1],
        [-1, -1],
        [1, -1],
        [-1, 1]
].freeze

    def horizontal__and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        self.move_dirs.each do |move_delta|
            dx, dy = move_delta
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        possible_moves
    end

    def move_dirs
        raise NotImplementedError
    end

    #only collects moves in one direction
    def grow_unblocked_moves_in_dir(dx, dy) #dx starts:[0,1] 
        moves_in_dir = []
        cur_row, cur_col = self.pos         #begin at [0,0]

        while true
            new_pos = [cur_row += dx, cur_col += dy]          #new_pos: [0,1]
            break unless self.board.valid_position?(new_pos)
            if board.empty?(new_pos)
                moves_in_dir << new_pos
            else
                if self.color != self.board[new_pos].color
                    moves_in_dir << new_pos
                    break
                else
                   break
                end
            end
        end
        return moves_in_dir
    end

end
