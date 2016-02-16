module Chess
# x and y correspond to col and row
  class Board
    attr_accessor :grid
    def initialize
      @grid = Array.new(8) {Array.new(8)}
      init_place_piece
    end

    def init_place_piece
      # I am not too sure of how to use symbols correctly
      # knight intentionally spelt wrong for simplicity in piece methods
      (0..7).each {|pos| @grid[pos][1] = Pawn.new("pawn#{pos}", :white)}
      (0..7).each {|pos| @grid[pos][6] = Pawn.new("pawn#{pos}", :black)}
      @grid[0][0] = Rook.new('rook0', :white)
      @grid[7][0] = Rook.new('rook1', :white)
      @grid[0][7] = Rook.new('rook0', :black)
      @grid[7][7] = Rook.new('rook1', :black)
      @grid[1][0] = Knight.new('night0', :white)
      @grid[6][0] = Knight.new('night1', :white)
      @grid[1][7] = Knight.new('night0', :black)
      @grid[6][7] = Knight.new('night1', :black)
      @grid[2][0] = Bishop.new('bishop0', :white)
      @grid[5][0] = Bishop.new('bishop1', :white)
      @grid[2][7] = Bishop.new('bishop0', :black)
      @grid[5][7] = Bishop.new('bishop1', :black)
      @grid[3][0] = Queen.new('queen0', :white)
      @grid[3][7] = Queen.new('queen0', :black)
      @grid[4][0] = King.new('king0', :white)
      @grid[4][7] = King.new('king0', :black)
    end

    def display
      puts "\n"
      puts " y  #{TABLE_LINES[:l_t_corner]}#{(TABLE_LINES[:h_line]*5 + TABLE_LINES[:mid_top_join])*7}#{TABLE_LINES[:h_line]*5 + TABLE_LINES[:r_t_corner]}"
      7.downto(0).each do |row|
        print "    #{TABLE_LINES[:v_line]}"
        7.downto(0).each do |col|
          bold = ["\033[1m\e[3m", "\e[23m\033[0m"]
          piece = grid[col][row]
          piece.nil? ? print("    ") : print("  #{bold.first}#{piece.unicode}#{bold.last} ")
          print " #{TABLE_LINES[:v_line]}"
        end
        print "\n #{row}  #{TABLE_LINES[:v_line]}"
        7.downto(0).each do |col|
          piece = grid[col][row]
          piece.nil? ? print("    ") : print(" #{piece.code}")
          print " #{TABLE_LINES[:v_line]}"
        end
        puts "\n    #{TABLE_LINES[:v_l_join]}#{(TABLE_LINES[:h_line]*5 + TABLE_LINES[:mid_join])*7}#{TABLE_LINES[:h_line]*5 + TABLE_LINES[:v_r_join]}" if !(row == 0)
      end
      puts "\n    #{TABLE_LINES[:l_b_corner]}#{(TABLE_LINES[:h_line]*5 + TABLE_LINES[:mid_bot_join])*7}#{TABLE_LINES[:h_line]*5 + TABLE_LINES[:r_b_corner]}"
      puts "    x  0     1     2     3     4     5     6     7 "
    end

    def check?(player)
      #true when a possible_move of opponents piece includes the players king piece location
      king_location = get_piece_location {|piece| piece.name == 'king0' && piece.color == player.color}
     # return true if iterate_grid {|piece, _| piece.color != player.color && piece.possible_moves.include?(king_location)}
      return true if iterate_grid {|piece, _| player.color != piece.color && [[1,4],[3,2],[4,7]].include?(king_location)} # for testing
      false
    end

    def get_piece_location
      iterate_grid do |piece,loc|
        next if piece.nil?
        return loc if yield piece
      end
    end

    def iterate_grid
      @grid.each_with_index do |col_array, col_num|
        col_array.each_with_index do |piece, row_num|
          next if piece.nil? # might need to fix this later
          yield piece,[col_num,row_num]
          end
        end
    end
  end
end