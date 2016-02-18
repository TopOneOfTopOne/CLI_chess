require_relative 'spec_helper'

describe Chess::Player do

  before do
    @player = instance_double('Player',name: 'j', :color => :white)
    @board = Chess::Board.new
  end

  describe '#select_piece(board)' do
    it 'returns [piece,piece_loc]' do
      expect(@player.select_piece(@board))
    end
  end

end