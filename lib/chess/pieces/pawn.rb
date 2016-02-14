module Chess
  class Pawn < Piece
    attr_accessor :valid_moves
    def initialize(name, color)
      super
      @valid_moves = color == :black ? [[0, 1], [0, 2], [1, 1], [-1, 1]] : [[0, -1], [0, -2], [-1, -1], [1, -1]]
    end
  end
end