module Chess
  # pawn is a special case because it is the only one that changes its movement behaviour depending on if it is first turn or if it can attack
  # will leave this for now
  class Pawn < Piece
    attr_accessor :valid_moves, :possible_moves
    def initialize(name, color)
      super
      @valid_moves = color == :black ? [[0, 1], [1, 1], [-1, 1]] : [[0, -1], [-1, -1], [1, -1]]
    end

    # def calc_possible_moves(board)
    #   location = board.get_piece_location {|piece| piece.name == @name && piece.color == @color}
    #   current_valid_moves = []
    #   # this aims to transpose each valid move according to current location to give a valid moves array for the given location
    #   # I have deliberately made a lot of pointless variables to show what is going on
    #   @valid_moves.each do |move|
    #     x_spaces = move[0]
    #     y_spaces = move[1]
    #     new_x = location[0] + x_spaces
    #     new_y = location[1] + y_spaces
    #     current_valid_moves << [new_x,new_y]
    #   end
    #
    #   possible_moves = []
    #
    # end
  end
  
  def possible_moves(board)
    current_loc = get_piece_location(board)
    moves = []
    add_first_move_behaviour if first_move?(current_loc)
    @valid_moves.each do |move|
      move = [current_loc[0]+move[0], current_loc[1]+move[1]] # transposing pawn movement behaviour to current location
      if moving_forward?(move, current_loc)
        next if pawn_blocked?(move, board, current_loc)
        moves += move
      elsif killing?(move, board)
        moves += move
      end
    end
  end

  def moving_forward?(new_loc, current_loc)
    true if new_loc[0] == current_loc[0]
    false
  end
  def first_move?(loc)
    return true if (@color = :white && loc[1] == 1) || (@color = :black && loc[1] == 6)
    false
  end

  def add_first_move_behaviour
    @color == :white ? @valid_moves + [0,2] : @valid_moves + [0,-2]
  end

  def pawn_blocked?(new_loc, board, current_loc)
    board.iterate_grid {|_, loc| return true if loc == new_loc && moving_forward?(new_loc,current_loc)}
    false
  end
end