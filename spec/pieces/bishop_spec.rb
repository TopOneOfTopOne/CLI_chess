require_relative '../spec_helper'

describe Chess::Bishop do
  before do
    @board = Chess::Board.new
    @bishop = Chess::Bishop.new('bishop1', :white)
  end

  describe "#possible_moves" do
    context "starting postion of bishop" do
      subject {@bishop.possible_moves(@board)}
      it {is_expected.to eq([])}
    end
    it 'at 3,4 loc and kill only' do
      @board.move_piece([5,0], [3,4])
      expect(@bishop.possible_moves(@board,true)).to eq([[1, 6], [5, 6]])
    end
  end
end