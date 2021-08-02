# frozen_string_literal: true

#   1. Create a board
#   2. Update the board
#   3. Check whether there's a winner
# class for the board
class Board
  attr_reader :squares

  WINNING_BOARDS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def set_coordinate(coordinate, symbol)
    @squares[coordinate - 1] = symbol
  end

  def full?
    @squares.all? { |val| val.is_a?(String) }
  end

  # if taken, return true
  # 8 & 9 always taken,
  # 6 & 7 never taken
  def taken?(coordinate)
    squares[coordinate - 1].is_a?(Numeric) ? false : true
  end

  def winner?
    WINNING_BOARDS.any? do |board|
      [squares[board[0]], squares[board[1]], squares[board[2]]].uniq.length == 1
    end
  end

  # rubocop:disable Metrics/AbcSize
  def print_board
    puts <<-HEREDOC

       #{squares[0]} | #{squares[1]} | #{squares[2]}
      ---+---+---
       #{squares[3]} | #{squares[4]} | #{squares[5]}
      ---+---+---
       #{squares[6]} | #{squares[7]} | #{squares[8]}

    HEREDOC
  end
  # rubocop:enable Metrics/AbcSize
end
