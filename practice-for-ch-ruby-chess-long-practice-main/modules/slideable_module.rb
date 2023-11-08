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

        #iterate over pieces possible directions
        #use piece subclass move_dirs method and pieces @pos
        #for each direction collect all possible moves in that direction
        #add those moves to moves array
        #use grow unblocked method to loop

        possible_moves
    end

    def move_dirs
        raise NotImplementedError
    end

    #only colleects moves in one direction
    def grow_unblocked_moves_in_dir(dx, dy)

    end

end
