require_relative 'spec_helper'

describe Chess::UI do
  before do
    @board = Chess::Board.new
  end
  describe '#parse' do
    it 'returns an array of numbers' do
      expect(Chess::UI.parse('21')).to eq([2,1])
    end
    it 'returns nil from strings' do
      expect(Chess::UI.parse('abc')).to be_nil
    end
    it 'is not a problem adding special characters' do
      expect(Chess::UI.parse('1,2')).to eq([1,2])
    end
  end

  describe '#correct_loc_format?' do
    it 'is correct format' do
      expect(Chess::UI.correct_loc_format?('12')).to eq([1,2])
    end
    it 'is not a number' do
      expect(Chess::UI.correct_loc_format?('abc')).to be_nil
    end
    it 'Number is not in range 0-7' do
      expect(Chess::UI.correct_loc_format?('99')).to be_nil
    end
  end

  describe '#valid_piece_selection' do
    it 'is a valid piece selection' do
      expect(Chess::UI.valid_piece_selection?(@board,:white,[1,1])).to be_truthy
    end
    it 'is not your piece' do
      expect(Chess::UI.valid_piece_selection?(@board,:white,[1,6])).to be_falsey
    end
    it 'king has no moves at starting postion' do
      expect(Chess::UI.valid_piece_selection?(@board,:white,[3,0])).to be_falsey
    end
  end
end