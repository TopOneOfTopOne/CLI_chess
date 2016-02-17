module Chess
  class Knight < Piece
    attr_accessor :valid_moves
    def initialize(name, color)
      super
      @valid_moves = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
    end

    def possible_moves(board)
      moves = []
      current_loc = get_piece_location(board)
      p current_loc
      valid_moves.each do |move|
        move = move_helper(board, 1) { |_| [current_loc[0]+move[0], current_loc[1]+move[1]] }
        next if move.empty?
        moves += move
      end
      moves
    end
  end
end
