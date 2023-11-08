module Stepable #knight, king

    #collect moves piece can move too
    def moves
      # # create an array to collect moves
      step_moves = []
      # iterate through each of the piece's possible move_diffs
      self.move_dirs.each do |move_delta|
        # for each diff, increment the piece's position to generate a new position
        dx, dy = move_delta 
        cur_row, cur_col = self.pos
        new_pos = [cur_row + dx, cur_col + dy]
        # unless the new_pos if valid, skip to next iteration
        next unless self.board.valid_position?(new_pos)
        if self.board.empty?(new_pos)
        # add the new position to the moves array if it is valid, on the board and empty
          step_moves << new_pos
        else
        # OR on the board and contains a piece of the opposite color
          if self.color != self.board[new_pos].color
            step_moves << new_pos
          else # if the colors are the same, just go to the next position
            next
          end 
        end
      end
      # return final array of moves
      step_moves
    end

    def move_diffs
      #subclass will have this
      raise NotImplementedError
    end


end
