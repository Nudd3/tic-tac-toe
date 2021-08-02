# frozen_string_literal: true

require_relative 'board'
# game class
class Game
  def initialize
    @board = Board.new
  end

  def play
    while true
      @board.print_board
      print 'Select where to place your symbol or "q" to exit: '
      user_input = gets.chomp
      print "\n"
      break if user_input == 'q'
    end
  end

end

g = Game.new
g.play
