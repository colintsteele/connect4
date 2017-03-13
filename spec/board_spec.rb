require 'spec_helper'

describe 'Board #drop' do

  before :all do
    @board = Board.instance
    @tiles_high = @board.tiles_high
    @tiles_wide = @board.tiles_wide
  end

  before :each do
    @board.reset
  end

  it 'should find the bottom row when empty' do
    expect(@board.find_bottom(1)).to be(@tiles_high - 1)
  end

  it 'should drop a tile at the bottom of a column' do
    bottom = @board.find_bottom(0)
    @board.drop(1)
    expect(@board.find_bottom(0)).to be bottom - 1
  end

  it 'should drop in second-to-last row after first drop' do
    @board.drop(1)
    expect(@board.find_bottom(0)).to be @tiles_high - 2
  end

  it 'should not drop a tile into a full column' do
    (@tiles_high).times do
      @board.drop(1)
      @board.print_board
    end
    expect(@board.slots[0][0]).to be_nil
  end

  it 'should move the top tile left and right' do
    @board.move_right
    expect(@board.current_column).to be 1
    @board.move_left
    expect(@board.current_column).to be 0
  end

  it 'should drop a tile in the second column after moving right once' do
    @board.move_right
    @board.drop(1)
    expect(@board.slots[1][@tiles_high-1]).to be 1
  end

  it 'should not move the tile past the left and right boundaries' do
    (@tiles_wide + 1).times do
      @board.move_right
    end
    expect(@board.current_column).to be(@tiles_wide - 1)

    (@tiles_wide + 1).times do
      @board.move_left
    end
    expect(@board.current_column).to be 0
  end

  # it 'should render' do
  #   @board.show
  #   @board.draw
  # end


end

describe 'Board #find_bottom' do

  before :all do
    @board = Board.instance
    @tiles_high = @board.tiles_high
    @tiles_wide = @board.tiles_wide
  end
end


