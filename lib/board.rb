# frozen_string_literal: true

# class for the board
class Board
  @@WINNING_BOARDS = [1, 2, 3], [4, 5, 6], [7, 8, 9],
                     [1, 4, 7], [2, 5, 8], [3, 6, 9],
                     [1, 5, 9], [3, 5, 7]

  def initialize
    @board = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]
  end

  def winning?
    @board.each do |sub_array|
      return true if @@WINNING_BOARDS.include?(sub_array)
    end
    false
  end

  def set_coordinate(coordinate, symbol)
    case coordinate
    when 1 then @board[0][0] = symbol
    when 2 then @board[0][1] = symbol
    when 3 then @board[0][2] = symbol
    when 4 then @board[1][0] = symbol
    when 5 then @board[1][1] = symbol
    when 6 then @board[1][2] = symbol
    when 7 then @board[2][0] = symbol
    when 8 then @board[2][1] = symbol
    when 9 then @board[2][2] = symbol
    else puts 'coordinate needs to be between 1-9'
    end
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
