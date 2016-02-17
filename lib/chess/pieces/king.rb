module Chess
  class King < Piece
    def initialize(name, color)
      super
    end

    def possible_moves(board)
      diagonal_moves(board,1) + line_moves(board, 1)
    end
  end
end