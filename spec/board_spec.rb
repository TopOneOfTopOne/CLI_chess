require_relative 'spec_helper'
describe Chess::Board do
    before :each do
      @board = Chess::Board.new
      @player = instance_double('Chess::Player', :name, :color => :black)
    end

  describe "#move_piece" do
    board = Chess::Board.new
    board.move_piece([1,1],[3,4])
    context "old loc" do
      it 'should be set to nil' do
        expect(board.grid[1][1]).to be_nil
      end
    end
    context "new loc" do
      it 'should be a piece' do
        expect(board.grid[3][4]).to be_an_instance_of Chess::Pawn
      end
    end
  end

  describe '#undo_move' do
    board = Chess::Board.new
    board.move_piece([1,1],[3,4])
    board.undo_move
    context 'old loc' do
      subject { board.grid[1][1] }
      it {is_expected.to be_an_instance_of (Chess::Pawn)}
    end
    context 'new loc' do
      subject { board.grid[3][4]}
      it { is_expected.to be_nil }
    end
  end

  describe '#display' do
    @board.display
  end
end

