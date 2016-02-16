module Chess
  class Piece
    attr_accessor :name, :color, :unicode, :code
    def initialize(name, color)
      @name = name
      @color = color
      @code = "#{color.to_s[0]}_#{name[0].upcase}"
      @unicode = UNICODE_PIECES[@code]
    end

    # really a helper method
    def calc_possible_moves(board,valid_moves)
      location = board.get_piece_location {|piece| piece.name == @name && piece.color == @color}
      current_valid_moves = []
      # this aims to transpose each valid move according to current location to give a valid moves array for the given location
      # I have deliberately made a lot of pointless variables to show what is going on
      valid_moves.each do |move|
        x_spaces = move[0]
        y_spaces = move[1]
        new_x = location[0] + x_spaces
        new_y = location[1] + y_spaces
        current_valid_moves << [new_x,new_y]
      end
      current_valid_moves
      possible_moves = []
      current_valid_moves.each do |move|
        if blocked?(move) || out_of_board?(move) || board.check?(@color)

        end
      end
    end
  end
end
