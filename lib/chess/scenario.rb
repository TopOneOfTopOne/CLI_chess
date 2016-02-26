module Chess
  # special scenarios in chess
  module Scenario
    def self.check?(color,board)
      #true when a possible_move of opponents piece includes the players king piece location
      kill_only = true # only need locations where opponents pieces can attack
      king = nil
      board.iterate_grid {|piece, loc| king = loc if (piece.name == 'king0' && piece.color == color)}
      board.iterate_grid {|piece, _| return true if (piece.color != color && piece.possible_moves(board,kill_only).include?(king))}
      false
    end

    def self.promote_pawn?(color,board)
      board.iterate_grid do |piece, loc|
       if piece.color == color && piece.name.include?('pawn')
         if loc[1] == 7 || loc[1] == 0
           return piece
         end
       end
      end
      nil
    end

    def self.promote_pawn(player,board)
      piece = promote_pawn?(player.color,board)
      piece_loc = board.get_piece_loc(piece.color,piece.name)
      queen_num = board.count_piece(piece)  - 1
      board.grid[piece_loc[0]][piece_loc[1]] = Queen.new("queen#{queen_num}", player.color)
    end

    def self.checkmate?(color, board)
      return false unless check?(color,board)
      board.iterate_grid do |piece, _|
        return false if piece.color == color && piece.possible_moves(board).any?
      end
      true
    end

    def self.stalemate?(board)
      board.iterate_grid do |piece, loc|
        return false if piece.possible_moves(board).any?
      end
      true
    end
  end
end