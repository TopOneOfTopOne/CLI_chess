module Chess
  class Player
    attr_accessor :name, :color
    def initialize(color)
      Printer.get_name(color)
      @name = UI.get_name
      @color = color
    end

    def select_piece(board)
      Printer.piece_select(player)
      piece_loc = UI.get_piece_loc(board, @color)
      board.iterate_grid {|piece, loc| return [piece,piece_loc] if piece_loc == loc}
    end

    def move_piece(board)
      selected_piece,piece_loc = select_piece(board)
      possible_moves = selected_piece.possible_moves(board)
      Printer.move_to(possible_moves)
      move_to_loc = UI.get_move_to_loc(possible_moves)
      board.move_piece(piece_loc,move_to_loc)
    end
  end
end
