require 'spec_helper'

describe 'drop thingy' do

  before :all do
    @height, @width = Board.height_width
  end

  it 'should find the bottom row when empty' do
    expect(Board.find_bottom(1)).to be(@height + 1)
  end

  it 'should find second-to-last row after first drop' do
    Board.drop(1, 1)
    expect(Board.find_bottom(1)).to be @height
  end

  it 'should not drop on a full column' do
    @height.times do
      Board.drop(1, 1)
    end
    expect(Board.drop(1, 1)).to be_nil
  end


end


