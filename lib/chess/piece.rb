module Chess
  # I have intentionally made long variable names to make it easier to read
  # not sure about including @board here
  class Piece
    attr_accessor :name, :color, :unicode, :code
    def initialize(name, color)
      @name = name
      @color = color
      @code = "#{color.to_s[0]}_#{name[0].upcase}"
      @unicode = UNICODE_PIECES[@code]
    end

    # really a helper method
    # def current_valid_moves(board,valid_moves)
    #   location = board.get_piece_location {|piece| piece.name == @name && piece.color == @color}
    #   current_valid_moves = []
    #   # this aims to transpose each valid move according to current location to give a valid moves array for the given location
    #   # I have deliberately made a lot of pointless variables to show what is going on
    #   valid_moves.each do |move|
    #     x_spaces = move[0]
    #     y_spaces = move[1]
    #     new_x = location[0] + x_spaces
    #     new_y = location[1] + y_spaces
    #     current_valid_moves << [new_x,new_y]
    #   end
    #   current_valid_moves
    # end
    #
    # #linked with current valid moves method
    # def possible_moves(current_valid_moves)
    #   possible_moves = []
    #   current_valid_moves.each do |move|
    #     if !blocked?(move) && !out_of_board?(move)
    #       board.move_piece(location, move)
    #       if !board.check?(@color)
    #         possible_moves << move
    #       end
    #       board.undo_move(location, move)
    #     end
    #   end
    # end

    def get_piece_location(board)
      board.get_piece_location {|piece| piece.name == @name && piece.color == @color}
    end

    # helps with finding possible moves up to l length
    def move_helper(board, l)
      line_moves = []
      (1..l).each do |spaces|
        new_loc = yield spaces
        if (blocked?(new_loc, board) || out_of_board?(new_loc))
          return line_moves
        elsif kill?(new_loc, board)
          line_moves << new_loc
          return line_moves
        else
          line_moves << new_loc
        end
      end
      line_moves
    end

    # finds all possible line moves
    # seems like bad design passing in board argument
    def line_moves(board, l)
      location = get_piece_location(board)
      right_moves = move_helper(board, l) {|spaces| [location[0]+spaces, location[1]]}
      left_moves = move_helper(board, l) {|spaces| [location[0]-spaces, location[1]]}
      forward_moves = move_helper(board, l) {|spaces| [location[0], location[1]+spaces]}
      backward_moves = move_helper(board, l) {|spaces| [location[0], location[1]-spaces]}
      right_moves + left_moves + forward_moves + backward_moves
    end

    # finds all possible diagonal moves
    def diagonal_moves(board, l)
      location = get_piece_location(board)
      diagonal_moves1 = move_helper(board, l) {|spaces| [location[0]-spaces, location[1]+spaces]}
      diagonal_moves2 = move_helper(board, l) {|spaces| [location[0]+spaces, location[1]+spaces]}
      diagonal_moves3 = move_helper(board, l) {|spaces| [location[0]+spaces, location[1]-spaces]}
      diagonal_moves4 = move_helper(board, l) {|spaces| [location[0]-spaces, location[1]-spaces]}
      diagonal_moves1 + diagonal_moves2 + diagonal_moves3 + diagonal_moves4
    end

    def blocked?(new_location, board)
      board.iterate_grid do |piece, location|
        return true if piece.color == @color && location == new_location
      end
      false
    end

    def out_of_board?(new_loc)
      if (new_loc[0] > 7 || new_loc[0] < 0 || new_loc[1] >7 || new_loc[1] < 0)
        return true
      end
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