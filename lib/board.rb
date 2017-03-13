require 'singleton'
require 'gosu'

class Board < Gosu::Window
  include Singleton
  attr_reader :current_column, :tiles_high, :tiles_wide, :slots

  def initialize
    @tiles_high = 7
    @tiles_wide = 7
    @current_column = 0
    super(100 * @tiles_high, 100 * @tiles_wide)
    @slots = Array.new(@tiles_high){ Array.new(@tiles_wide) }
  end

  def all_slots(&block)
    @tiles_wide.times do |row|
      @tiles_high.times do |column|
        yield(row, column)
      end
    end
  end

  def print_board
    print "\n"
    all_slots do |column, row|
      case @slots[row][column]
        when 1
          print("[X]")
        when 2
          print("[O]")
        else
          print("[-]")
      end
      print "\n" if row == @tiles_wide - 1
    end
  end


  def move_right
    return nil if @current_column == (@tiles_wide - 1)
    @current_column += 1
  end

  def move_left
    return nil if @current_column == 0
    @current_column -= 1
  end

  def drop(player, column = @current_column)
    bottom_row = find_bottom(column)
    if bottom_row == 0
      return nil
    else
      @slots[column][bottom_row] = player
    end
  end

  def find_bottom(column)
    @tiles_high.times do |row|
      return (row - 1) if @slots[column][row]
    end
    @tiles_high - 1
  end

  def reset
    @slots = Array.new(@tiles_high){ Array.new(@tiles_wide) }
  end
  #gosu methods

  def draw
    p = Gosu::Image.new('4row_red.png')
    p.draw((@current_column * 100), 0, 1)


  end

  def button_down(id)
    if id == Gosu::KB_RIGHT
      move_right
    elsif id == Gosu::KB_LEFT
      move_left
    elsif id == Gosu::KB_DOWN
      drop(1)
    end
  end
end

