require_relative 'spec_helper'

describe 'Game' do
  before do
    @game = Chess::Game.new
  end
  describe '.check?' do
    expect(@game.check?(:white)).to eq(false)
  end


end