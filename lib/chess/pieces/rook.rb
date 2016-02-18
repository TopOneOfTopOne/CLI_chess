module Chess
  class Rook < Piece
    def initialize(name, color)
      super
    end

    def possible_moves(board, kill_only = false)
      line_moves(board, 7,kill_only)
    end

  end
end