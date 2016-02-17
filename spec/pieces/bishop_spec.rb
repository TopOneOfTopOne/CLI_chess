require_relative '../spec_helper'

describe Chess::Bishop do
  before do
    @board = Chess::Board.new
    @bishop = Chess::Bishop.new('bishop1', :white)
  end

  describe "#possible_moves" do
    context "starting postion of bishop" do
      subject {@bishop.possible_moves(@board)}
      it {is_expected.to eq([])}
    end
  end
end