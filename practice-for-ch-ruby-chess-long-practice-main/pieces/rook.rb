require_relative "piece"
require_relative 'slideable'

class Rook < Piece
    include Slideable
    def symbol
        '♜'.colorize(color)
    end


    
    protected
    def move_dirs
        horizontal__and_vertical_dir
    end

end
