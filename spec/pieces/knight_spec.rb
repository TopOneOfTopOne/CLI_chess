require_relative '../spec_helper'

describe Chess::Knight do
  before do
    @board = Chess::Board.new
    @knight1 = Chess::Knight.new('night1', :white)
  end

  describe '#possible_moves' do
    subject { @knight1.possible_moves(@board) }
    it {is_expected.to eql([[7,2], [5,2]])}
  end
end