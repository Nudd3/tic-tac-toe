# frozen_string_literal: true

# class for the board
class Board
  @@WINNING_BOARDS = [1, 2, 3], [4, 5, 6], [7, 8, 9],
                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
                     [1, 5, 9], [3, 5, 7]

  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def winning?
    @board.each do |sub_array|
      return true if @@WINNING_BOARDS.include?(sub_array)
    end
    false
  end

  def print_board
    @board.each do |row|
      row.each do |val|
        print "#{val} "
      end
      print "\n"
    end
  end
end

b = Board.new
puts b.winning?
b.print_board
