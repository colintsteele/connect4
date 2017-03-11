class Board
  @@height = 7
  @@width = 7

  @@slots = Array.new(@@height){Array.new(@@width)}

  class << self

    def slots
      @@slots
    end

    def height_width
      return @@height, @@width
    end

    def drop(player, column)
      bottom_row = find_bottom(column)
      if bottom_row == 0
        return nil
      else
        @@slots[column][bottom_row - 1] = player
      end
    end

    def find_bottom(column)
      @@slots[column].length.times do |row|
        return row if @@slots[column][row]
      end
      @@height + 1
    end

  end

end