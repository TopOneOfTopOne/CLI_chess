require_relative 'spec_helper'

describe Chess::UI do
  let(:board) {Chess::Board.new}
  describe '#parse' do
    it 'returns array of numbers given numbers' do
     expect(Chess::UI.parse('21')).to eq([2,1])
     end
    it 'is not a problem adding special characters' do
      expect(Chess::UI.parse('1,2.!')).to eq([1,2])
    end
    it 'returns nil from strings' do
      expect(Chess::UI.parse('abc')).to be_nil
    end

  end

  describe '#correct_loc_format' do
    it 'returns array given correct input' do
      expect(Chess::UI.correct_loc_format('00')).to eq([0,0])
    end
    it 'returns array given correct input' do
      expect(Chess::UI.correct_loc_format('77')).to eq([7,7])
    end
    it 'returns nil given more than 2 numbers' do
      expect(Chess::UI.correct_loc_format('123')).to be_nil
    end
    it 'returns nil given a string' do
      expect(Chess::UI.correct_loc_format('abc')).to be_nil
    end
    it 'returns nil given incorrect range of numbers' do
      expect(Chess::UI.correct_loc_format('99')).to be_nil
    end
  end

  describe '#valid_piece_selection' do

    it 'is a valid piece selection' do
      expect(Chess::UI.valid_piece_selection?(board,:white,[1,1])).to be_truthy
    end
    it 'is not your piece' do
      expect(Chess::UI.valid_piece_selection?(board,:white,[1,6])).to be_falsey
    end
    it 'king has no moves at starting position' do
      expect(Chess::UI.valid_piece_selection?(board,:white,[3,0])).to be_falsey
    end
  end
end