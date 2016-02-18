require_relative 'spec_helper'

describe Chess::UI do

  describe '#parse' do
    it 'returns an array of numbers' do
      expect(Chess::UI.parse('21')).to eq([2,1])
    end
    it 'returns nil from strings' do
      expect(Chess::UI.parse('abc')).to be_nil
    end
  end

  describe '#correct_loc_format?' do
    it 'is correct format' do
      expect(Chess::UI.correct_loc_format?([1,2])).to be_true
    end
  end
end