require_relative '../spec_helper'

describe Chess::Queen do
  before do
    @board = Chess::Board.new
    @queen = Chess::Queen.new('queen0',:white)
  end

  describe '#possible_moves' do
    it 'is kill only mode' do
      expect(@queen.possible_moves(@board, true)).to eq([])
    end
  end
end