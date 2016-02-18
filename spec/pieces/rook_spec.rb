require_relative '../spec_helper'

describe Chess::Rook do

  before do
    @board = Chess::Board.new
    @rook = Chess::Rook.new('rook1',:white)
  end

  describe '#possible_moves' do
    it 'is kill only mode' do
      expect(@rook.possible_moves(@board,true)).to eq([])
    end
  end
end