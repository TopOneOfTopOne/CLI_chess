module Chess
  module Scenario
    def self.check?(color,board)
      #true when a possible_move of opponents piece includes the players king piece location
      kill_only = true # only need locations where opponents pieces can attack
      king = nil
      board.iterate_grid {|piece, loc| king = loc if (piece.name == 'king0' && piece.color == color)}
      board.iterate_grid {|piece, _| return true if (piece.color != color && piece.possible_moves(board,kill_only).include?(king))}
      false
    end

    def self.en_passant?(color,board)
      board.iterate_grid do |piece,_|
       return true if piece.color == color && piece.name.include?('pawn')
      end
    end

    def self.en_passant(color,board)

    end
  end
end