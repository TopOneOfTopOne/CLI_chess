module Chess
  class Board
    def initialize
      @grid = Array.new(8) {Array.new(8)}
      init_place_piece
    end

    def init_place_piece
      (0..7).each {|pos| @grid[pos][1] = Pawn.new("pos", :black)}
      (0..7).each {|pos| @grid[pos][6] = Pawn.new("pos", :white)}
      @grid[0][0] = Rook.new("rook0", :black)
      @grid[7][0] = Rook.new("rook1", :black)
      @grid[0][7] = Rook.new("rook0", :white)
      @grid[7][7] = Rook.new("rook1", :white)
      @grid[1][0] = Knight.new("knight0", :black)
      @grid[6][0] = Knight.new("knight1", :black)
      @grid[1][7] = Knight.new("knight0", :white)
      @grid[6][7] = Knight.new("knight1", :white)
      @grid[2][0] = Bishop.new("bishop0", :black)
      @grid[5][0] = Bishop.new("bishop1", :black)
      @grid[2][7] = Bishop.new("bishop0", :white)
      @grid[5][7] = Bishop.new("bishop1", :white)
      @grid[3][0] = Queen.new("queen0", :black)
      @grid[3][7] = Queen.new("qunee0", :white)
      @grid[4][0] = King.new("king0", :black)
      @grid[4][7] = King.new("king0", :white)
    end
  end
end