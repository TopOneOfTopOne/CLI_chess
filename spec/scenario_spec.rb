require_relative 'spec_helper'

describe Chess::Scenario do
  before do
    @board = Chess::Board.new
    @player = instance_double('Player', :color => :white)
  end
  context '#check?' do
    it 'is white in check' do
      @board.move_piece([4,0],[4,5]) # moving king to a check place
      expect(Chess::Scenario.check?(:white,@board)).to be_truthy
    end
    it 'white not in check' do
      expect(Chess::Scenario.check?(:white,@board)).to be_falsey
    end
  end

  context '#promote_pawn?' do
    it 'cannot promote pawn' do
      expect(Chess::Scenario.promote_pawn?(:white, @board)).to be_nil
    end
    it 'can promote pawn' do
      @board.move_piece([2,1],[2,7]) # moving pawn to end of board
      expect(Chess::Scenario.promote_pawn?(:white, @board)).to_not be_nil
    end
  end

  context '#promote_pawn' do
    it 'promotes a pawn' do
      @board.move_piece([2,1],[2,7])
      Chess::Scenario.promote_pawn(@player, @board)
      expect(@board.grid[2][7]).to be_an_instance_of(Chess::Queen)
    end
  end
end