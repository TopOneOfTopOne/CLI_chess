module Chess
  class Pawn < Piece
    attr_accessor :valid_moves, :possible_moves
    def initialize(name, color)
      super
      @valid_moves = color == :black ? [[0, 1], [0, 2], [1, 1], [-1, 1]] : [[0, -1], [0, -2], [-1, -1], [1, -1]]
    end

    def calc_possible_moves(board)
      location = board.get_piece_location {|piece| piece.name == @name && piece.color == @color}
    end
  end
end