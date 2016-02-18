require_relative '../spec_helper'

describe Chess::King do
  let(:piece) { Chess::King.new('king0',:white) }
  let(:board) { Chess::Board.new }

  describe '#possible_moves' do
    context "placing king at location 4,5" do
      before(:each) do
        board.move_piece([4,0],[4,5])
      end
      it 'is kill only' do
        expect(piece.possible_moves(board,true)).to eq([[3, 6], [5, 6], [4, 6]])
      end
      it 'has to move back' do
        expect(piece.possible_moves(board)).to eq([[5, 4], [3, 4], [4, 4]])
      end
    end
  end
end
