require_relative 'piece'

class Pawn < Piece
  def symbol
    
  end

  def moves
    possible_moves = []
    cur_x, cur_y = self.pos
    self.forward_dir.each do |move_delta|
      dx, dy = move_delta
      new_pos = [cur_x + dx, cur_y + dy]

      next unless board.valid_position?(new_pos)
      if (dx == 2 || dx == -2) && board.empty?([cur_x + dx - 1, cur_y]) && board.empty?([cur_x + dx, cur_y]) && at_start_row?(cur_x)
        possible_moves << new_pos
      end

      if forward?(move_delta)
        possible_moves << new_pos if board.empty?(new_pos)
      else
        possible_moves << new_pos if !board.empty?(new_pos) && side_attack(new_pos)
      end
    end
  end



  def at_start_row?(row)
    return true if row == 1 || row == 6
    #is it at the start of the game state or has it moved
    #if its on row one or six then it can move two squares else just one
  end

  def forward_dir
    if self.color == :white
      [
        [-1, 0],
        [-2, 0],
        [-1, -1],
        [-1, 1]
      ]
    else
      [
        [1, 0],
        [2, 0],
        [1, -1],
        [1, 1]
      ]
    end
    #is this pawn at the top of the board or the bottom.
    #if top return -1
    #if bottom return 1
  end

  def forward?(move_delta)
    #moving forward or diagonal
    move_delta[1] == 0 ? true : false
  end

  def side_attack(new_pos)
    #is there an opponents piece diagonally in front
    self.color != self.board[new_pos].color
  end

end
