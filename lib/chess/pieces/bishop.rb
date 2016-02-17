module Chess
  class Bishop < Piece
    def initialize(name, color)
      super
    end

    def possible_moves(board)
      diagonal_moves(board, 7)
    end
  end
end
