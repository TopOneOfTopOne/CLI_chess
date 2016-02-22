module Chess
  # handles the creation of possible moves for a general piece
  class Piece
    attr_accessor :name, :color, :unicode, :code
    def initialize(name, color)
      @name = name
      @color = color
      @code = "#{color.to_s[0]}_#{name[0].upcase}"
      @unicode = UNICODE_PIECES[@code]
    end
    
    # to see if moving to the new location leaves the king in check
    def caused_check?(new_loc, board)
      current_location = board.get_piece_loc(@color,@name)
      board.move_piece(current_location, new_loc)
      if Scenario.check?(color,board)
        board.undo_move # reverse the move
        return true
      end
      board.undo_move # we have to reverse the move regardless
      false
    end

    # def check?(board)
    #   kill_only = true # only need locations where opponent can kill
    #   king = nil
    #   board.iterate_grid {|piece, loc| king = loc if (piece.name == 'king0' && piece.color == @color) }
    #   board.iterate_grid {|piece, _| return true if (piece.color != color && piece.possible_moves(board, kill_only).include?(king))}
    #   false
    # end


    # helps with finding possible moves up to l length
    # passes validates move by checking if blocked?, out_of_board?, caused_check?, kill?
    # be careful when setting l = 1 returned array is: [[x,y]] so we cannot use (+) to add to an existing array instead (<<) needs to be used
    def move_helper(board, l, kill_only = false)
      moves = []
      (1..l).each do |spaces|
        new_loc = yield spaces # spaces represents number of squares away from oirginal piece position
        return moves if (blocked?(new_loc, board) || out_of_board?(new_loc))
        # there is no need to evaluate caused check if we just look at possible locations to kill but don't intend to exercise kill option.
        # This is useful for checking to see if player in check.
        next if !kill_only && caused_check?(new_loc, board)
        if kill?(new_loc, board)
          moves << new_loc
          return moves
        end
        moves << new_loc  unless kill_only
      end
      moves
    end

    # finds all possible line moves
    # seems like bad design passing in board argument
    def line_moves(board, l, kill_only = false)
      location = board.get_piece_loc(color,name)
      right_moves = move_helper(board, l, kill_only) {|spaces| [(location[0]+spaces), location[1]]}
      left_moves = move_helper(board, l, kill_only) {|spaces| [location[0]-spaces, location[1]]}
      forward_moves = move_helper(board, l, kill_only) {|spaces| [location[0], location[1]+spaces]}
      backward_moves = move_helper(board, l, kill_only) {|spaces| [location[0], location[1]-spaces]}
      right_moves + left_moves + forward_moves + backward_moves
    end

    # finds all possible diagonal moves
    def diagonal_moves(board, l, kill_only = false)
      location = board.get_piece_loc(color,name)
      diagonal_moves1 = move_helper(board, l, kill_only) {|spaces| [location[0]-spaces, (location[1]+spaces)]}
      diagonal_moves2 = move_helper(board, l, kill_only) {|spaces| [location[0]+spaces, (location[1]+spaces)]}
      diagonal_moves3 = move_helper(board, l, kill_only) {|spaces| [location[0]+spaces, (location[1]-spaces)]}
      diagonal_moves4 = move_helper(board, l, kill_only) {|spaces| [location[0]-spaces, (location[1]-spaces)]}
      diagonal_moves1 + diagonal_moves2 + diagonal_moves3 + diagonal_moves4
    end

    def blocked?(new_location, board)
      board.iterate_grid do |piece, location|
        return true if piece.color == @color && location == new_location
      end
      false
    end

    def out_of_board?(new_loc)
      return true unless new_loc[0].between?(0,7) && new_loc[1].between?(0,7)
      false
    end

    def kill?(new_loc, board)
      board.iterate_grid do |piece, location|
       return true if piece.color != @color && location == new_loc
      end
      false
    end

  end
end
