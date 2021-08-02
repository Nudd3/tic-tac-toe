# frozen_string_literal: true

require_relative 'board'
# game class
class Game
  def initialize
    @board = Board.new
    @players = Array.new
  end

  def create_player

  end

  def init_players
    print 'Name of first player: '
    first_player_name = gets.chomp
    print 'Symbol of first player: '
    first_player_symbol = gets.chomp
    print 'Name of second player: '
    second_player_name = gets.chomp
    print 'Symbol of second player: '
    second_player_symbol = gets.chomp
    players << Player.new(first_player_name, first_player_symbol)
    players << Player.new(second_player_name, second_player_symbol)
  end

  def play
    @board.print_board
    while true
      
      print 'Select where to place your symbol or "q" to exit: '
      user_input = gets.chomp
      print "\n"
      break if user_input == 'q'

      @board.set_coordinate(user_input.to_i, 'X')
      @board.print_board
      if @board.winning? 
        puts "WINNER!"
        break
      end
    end
  end
end

g = Game.new
g.play
