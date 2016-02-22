require_relative 'spec_helper'

describe Chess::Piece do
  before do
    @board = Chess::Board.new
    @bishop_w = Chess::Piece.new('bishop1', :white)
    @pawn_w = Chess::Piece.new('pawn1', :white)
    @piece2 = Chess::Piece.new('bishop0',:white)
    @board.grid[2][0] = nil
    @board.grid[7][2] = @piece2
  end
  # describe "#current_valid_moves" do
  #   subject {@board.grid[6][0].calc_possible_moves(@board,[[2, 1], [2, -1]])}
  #   it {is_expected.to eq([[8,1],[8,-1]])}
  # end

  describe "#blocked?" do
    # context "own piece location" do
    #   subject{@bishop_w.blocked?([1,1],@board)}
    #   it {is_expected.to eq(true)}
    # end
    it 'is a blocked location' do
      expect(@bishop_w.blocked?([1,1],@board)).to be_truthy
    end
    it 'is not blocked location' do
      expect(@bishop_w.blocked?([5,5],@board)).to be_falsey
    end
    # context "empty location" do
    #   subject{@bishop_w.blocked?([5,5], @board)}
    #   it {is_expected.to eq(false)}
    # end
  end

  describe "#out_of_board?" do
    # context "location inside board" do
    #   subject{@bishop_w.out_of_board?([7,7])}
    #   it {is_expected.to eq(false)}
    # end
    it 'is inside board' do
      expect(@pawn_w.out_of_board?([7,7])).to be_falsey
    end
    # context "location outside board" do
    #   subject {@bishop_w.out_of_board?([-8,0])}
    #   it {is_expected.to eq(true)}
    # end
    it 'is outside board' do
      expect(@bishop_w.out_of_board?([-8,0])).to be_truthy
    end
  end


  # describe "#move_helper" do
  #   context "An empty square" do
  #     subject {@bishop_w.move_helper(@board, 7) {|space| [5,5]}}
  #     it {is_expected.to eq([5,5])}
  #   end
  # end

  describe "#diagonal_moves" do
    # context "the possible moves with a location of [5,0] bishop limited to" do
    #   subject {@bishop_w.diagonal_moves(@board, 7)}
    #   it {is_expected.to eq([])}
    # end
    it 'has no diagonal moves' do
      expect(@bishop_w.diagonal_moves(@board,7)).to be_empty
    end
    it 'is kill only with no possible kills' do
      expect(@bishop_w.diagonal_moves(@board, 7, true)).to be_empty
    end
    it 'has diagonal moves' do
      expect(@piece2.diagonal_moves(@board,7)).to eq([[6,3],[5,4],[4,5],[3,6]])
    end
    it 'has kill only moves' do
      expect(@piece2.diagonal_moves(@board,7,true)).to eq([[3,6]])
    end

  end

  describe "#line_moves" do
    it 'has moves' do
      expect(@pawn_w.line_moves(@board,1)).to eq([[1,2]])
    end
    it 'has no moves' do
      expect(@bishop_w.line_moves(@board,7)).to be_empty
    end
  end
end


