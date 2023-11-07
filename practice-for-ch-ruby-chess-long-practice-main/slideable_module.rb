module Slideable

    HORIZONTAL_DIRS = [
        [0, 1],
        [0, -1],
        [1, 0],
        [-1, 0]
    ]
    DIAGONAL_DIRS = [
        [1, 1],
        [-1, -1],
        [1, -1],
        [-1, 1]
    ]

    def horizontal_dirs
        return HORIZONTAL_DIRS
    end

    def diagonal_dirs
        return DIAGONAL_DIRS
    end

    def moves 
        possible_moves = []

        self.pos 

        possible_moves
    end

end