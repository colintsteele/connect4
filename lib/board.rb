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

  def print
    binding.pry
    puts "\n"
    puts slots
  end

  def move_right
    return nil if @current_column == (@tiles_wide - 1)
    @current_column += 1
  end

  def move_left
    return nil if @current_column == 0
    @current_column -= 1
  end

  def height_width
    return @tiles_high, @tiles_wide
  end

  def drop(player, column = @current_column)
    bottom_row = find_bottom(column)
    if bottom_row == 0
      return nil
    else
      @slots[column][bottom_row - 1] = player
    end
  end

  def find_bottom(column)
    @slots[column].length.times do |row|
      return row if @slots[column][row]
    end
    @tiles_high + 1
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
      puts drop(1), @current_column
    end
  end

end

