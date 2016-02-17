require_relative 'spec_helper'

describe Chess::Piece do
  before do
    @board = Chess::Board.new
    @bishop_w = Chess::Piece.new('bishop1', :white)
    @pawn_w = Chess::Piece.new('pawn1', :white)
  end
  # describe "#current_valid_moves" do
  #   subject {@board.grid[6][0].calc_possible_moves(@board,[[2, 1], [2, -1]])}
  #   it {is_expected.to eq([[8,1],[8,-1]])}
  # end

  describe "#blocked?" do
    context "own piece location" do
      subject{@bishop_w.blocked?([1,1],@board)}
      it {is_expected.to eq(true)}
    end
    context "empty location" do
      subject{@bishop_w.blocked?([5,5], @board)}
      it {is_expected.to eq(false)}
    end
  end

  describe "#out_of_board?" do
    context "location inside board" do
      subject{@bishop_w.out_of_board?([7,7])}
      it {is_expected.to eq(false)}
    end
    context "location outside board" do
      subject {@bishop_w.out_of_board?([-8,0])}
      it {is_expected.to eq(true)}
    end
  end


  # describe "#move_helper" do
  #   context "An empty square" do
  #     subject {@bishop_w.move_helper(@board, 7) {|space| [5,5]}}
  #     it {is_expected.to eq([5,5])}
  #   end
  # end

  describe "#diagonal_moves" do
    context "the possible moves with a location of [5,0] bishop limited to" do
      subject {@bishop_w.diagonal_moves(@board, 7)}
      it {is_expected.to eq([])}
    end
  end

  describe "#line_moves" do
    context "finding possible line moves for pawn" do
      subject {@pawn_w.line_moves(@board, 7)}
      it {is_expected.to eq([[1,2], [1,3], [1,4], [1,5], [1,6]])}
    end
  end

  describe '#get_piece_location' do
    subject { @pawn_w.get_piece_location(@board) }
    it { is_expected.to eq([1,1])}
  end
end


