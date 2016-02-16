module Chess
  class Knight < Piece
    attr_accessor :valid_moves
    def initialize(name, color)
      super
      @valid_moves = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
    end
  end
end
