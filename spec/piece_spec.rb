require_relative 'spec_helper'

describe Chess::Piece do
  before do
    @board = Chess::Board.new
  end
  describe "#current_valid_moves" do
    subject {@board.grid[6][0].calc_possible_moves(@board,[[2, 1], [2, -1]])}
    it {is_expected.to eq([[8,1],[8,-1]])}
  end
end