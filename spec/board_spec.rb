require 'spec_helper'

describe 'board behavior' do

  before :all do
    @board = Board.instance
    @tiles_high, @tiles_wide = @board.height_width
  end

  it 'should find the bottom row when empty' do
    expect(@board.find_bottom(1)).to be(@tiles_high + 1)
  end

  it 'should find second-to-last row after first drop' do
    @board.drop(1, 1)
    expect(@board.find_bottom(1)).to be @tiles_high
  end

  it 'should not drop on a full column' do
    @tiles_high.times do
      @board.drop(1, 1)
    end
    expect(@board.drop(1, 1)).to be_nil
  end

  it 'should move left and right' do
    @board.move_right
    expect(@board.current_column).to be 1
    @board.move_left
    expect(@board.current_column).to be 0
  end

  it 'should not the current_column tile past the boundaries' do
    (@tiles_wide + 1).times do
      @board.move_right
    end
    expect(@board.current_column).to be(@tiles_wide - 1)

    (@tiles_wide + 1).times do
      @board.move_left
    end
    expect(@board.current_column).to be 0
  end

  it 'should render' do
    @board.show
    @board.draw
  end

end


