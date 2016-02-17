require_relative '../spec_helper'

describe Chess::King do
  let(:piece) { Chess::King.new('king1',:black) }
  let(:board) { Chess::Board.new }

  describe '#possible_moves' do
    context "placing king at location 4,5" do
      before(:each) do
        board.grid[4][5] = piece
      end
      subject {piece.possible_moves(board)}
      it {is_expected.to eq([[5, 4], [3, 4], [5, 5], [3, 5], [4, 4]])}
    end
  end
end
