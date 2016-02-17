require_relative 'spec_helper'
describe Chess::Board do
    before :each do
      @board = Chess::Board.new
      @player = instance_double('Chess::Player', :name, :color => :black)
    end
  # it "tests grid instance variable" do
  #   expect(board.grid[0][0]).to be_an_instance_of(Chess::Rook)
  #   expect(board.grid[5][5]).to be_nil
  # end
  #
  # describe "#get_piece_location" do
  #   context "Getting location for black king" do
  #     subject {board.get_piece_location{|piece| piece.name == 'king0' && piece.color == :black}}
  #     it {is_expected.to eq([4,7])}
  #   end
  # end

  # describe "#check?" do
  #   subject {@board.check?(@player.color)}
  #   it {is_expected.to eq(true)}
  # end

  describe "#move_piece" do
    board = Chess::Board.new
    board.move_piece([1,1],[3,4])
    context "old loc" do
      subject {board.grid[1][1]}
      it { is_expected.to be_nil }
    end
    context "new loc" do
      subject { board.grid[3][4] }
      it { is_expected.to be_an_instance_of (Chess::Pawn) }
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
end

