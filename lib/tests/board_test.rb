require_relative '../chess'

board = Chess::Board.new
player = Chess::Player.new(:black)
# board.display
p board.check?(player)
