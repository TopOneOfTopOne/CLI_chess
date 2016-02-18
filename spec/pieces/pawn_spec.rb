require_relative '../spec_helper'

describe Chess::Pawn do
  before do
    @board = Chess::Board.new
    @pawn1 = Chess::Pawn.new('pawn1', :white)
  end

  describe '#possible_moves' do
    context 'pawn1 location starting postion'
    it 'returns correct possible moves' do
      expect( @pawn1.possible_moves(@board) ).to eq([[1,2],[1,3]])
      expect(@pawn1.possible_moves(@board)).to eq([[1,2],[1,3]])
      expect(@pawn1.possible_moves(@board)).to eq([[1,2],[1,3]])
      expect(@pawn1.possible_moves(@board)).to eq([[1,2],[1,3]])
    end

    it 'is kill only mode' do
      expect(@pawn1.possible_moves(@board,true)).to eq([])
    end
  end
end