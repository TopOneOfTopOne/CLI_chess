module Chess
  class King < Piece
    def initialize(name, color)
      super
    end

    def possible_moves(board,kill_only=false)
      diagonal_moves(board,1,kill_only) + line_moves(board, 1,kill_only)
    end
  end
end