require_relative 'spec_helper'
describe Chess::Board do
  before do
    @board = Chess:: Board.new
  end
  it "tests grid instance variable" do
    expect(@board.grid[0][0]).to be_an_instance_of(Chess::Rook)
    expect(@board.grid[5][5]).to be_nil
  end
end
