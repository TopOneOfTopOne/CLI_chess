module Chess
  # pawn
  # problem: calling possible_moves multiple times creates a larger valid moves list each time
  class Pawn < Piece
    attr_accessor :valid_moves,:temp_valid_moves
    def initialize(name, color)
      super
      @valid_moves = color == :black ? [[0, -1], [-1, -1], [1, -1]] : [[0, 1], [1, 1], [-1, 1]]
    end

    # returns an array of possible moves for given pawn piece in give location
    def possible_moves(board,kill_only=false)
      current_loc = board.get_piece_loc(color,name)
      moves = []
      add_first_move_behaviour if first_move?(current_loc)
      add_kill_only_behaviour if kill_only
      @valid_moves.each do |move|
        move = [current_loc[0]+move[0], current_loc[1]+move[1]] # transposing pawn movement behaviour to current location
        next if out_of_board?(move)
        if moving_forward?(move, current_loc)
          next if pawn_blocked?(move, board)
          moves << move
        elsif kill?(move, board)
          moves << move
        end
      end
      # need to reset the valid moves each time otherwise #add_first_move_behaviour and #add_kill_only_behaviour keep adding onto the array
      @valid_moves= color == :black ? [[0, -1], [-1, -1], [1, -1]] : [[0, 1], [1, 1], [-1, 1]]
      moves
    end

    # We know pawn is moving forward when x coordinate doesn't change
    def moving_forward?(new_loc, current_loc)
      return true if new_loc[0] == current_loc[0]
      false
    end

    # know it is pawn first move when their y coordinate is 6 for black or 1 for white since pawns only move forward
    def first_move?(loc)
      return true if (@color == :white && loc[1] == 1) || (@color == :black && loc[1] == 6)
      false
    end

    # only want attacking moves no moving forward
    def add_kill_only_behaviour
      @valid_moves= color == :black ? [[-1, -1], [1, -1]] : [[1, 1], [-1, 1]]
    end
    # adding the behaviour of pawns moving 2 spaces for first move
    def add_first_move_behaviour
      @color == :white ? @valid_moves << [0,2] : @valid_moves << [0,-2]
    end

    # pawns are special because blocked by both colors
    # therefore we need to create a new blocked? method specific to Pawn class
    def pawn_blocked?(new_loc, board)
      board.iterate_grid {|_, loc| return true if loc == new_loc}
      false
    end
  end
end