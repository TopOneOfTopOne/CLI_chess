require_relative 'spec_helper'
describe Chess::Board do
  before do
    @board = Chess::Board.new
    @player = instance_double('Chess::Player', :name, :color => :black)
  end
  # it "tests grid instance variable" do
  #   expect(@board.grid[0][0]).to be_an_instance_of(Chess::Rook)
  #   expect(@board.grid[5][5]).to be_nil
  # end
  #
  # describe "#get_piece_location" do
  #   context "Getting location for black king" do
  #     subject {@board.get_piece_location{|piece| piece.name == 'king0' && piece.color == :black}}
  #     it {is_expected.to eq([4,7])}
  #   end
  # end

  describe "#check?" do
    subject {@board.check?(@player.color)}
    it {is_expected.to eq(true)}
  end
end

