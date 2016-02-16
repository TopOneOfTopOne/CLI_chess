module Chess
  # pawn is a special case because it is the only one that changes its movement behaviour depending on if it is first turn or if it can attack
  # will leave this for now
  class Pawn < Piece
    attr_accessor :valid_moves, :possible_moves
    def initialize(name, color)
      super
      @valid_moves = color == :black ? [[0, 1], [0, 2], [1, 1], [-1, 1]] : [[0, -1], [0, -2], [-1, -1], [1, -1]]
    end

    def calc_possible_moves(board)
      location = board.get_piece_location {|piece| piece.name == @name && piece.color == @color}
      current_valid_moves = []
      # this aims to transpose each valid move according to current location to give a valid moves array for the given location
      # I have deliberately made a lot of pointless variables to show what is going on
      @valid_moves.each do |move|
        x_spaces = move[0]
        y_spaces = move[1]
        new_x = location[0] + x_spaces
        new_y = location[1] + y_spaces
        current_valid_moves << [new_x,new_y]
      end

      possible_moves = []

    end
  end
end