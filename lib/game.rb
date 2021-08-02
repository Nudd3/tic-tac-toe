# frozen_string_literal: true

# A game needs:
# two players
# a board

require_relative 'board'
require_relative 'player'
require_relative 'interface_messages'
# game class
class Game
  include InterfaceMessages

  attr_accessor :player_one, :player_two, :current_player

  def initialize
    @board = Board.new
    @player_one = nil
    @player_two = nil
    @current_player = nil
  end

  def play
    init_players
    @board.print_board
    while true
      print "#{current_player.name}'s turn"
      input = gets.chomp
      break if input == 'q'
      swap_turn
    end
  end

  private

  def init_players
    @player_one = create_player(1)
    @player_two = create_player(2)
    @current_player = player_one
  end

  def create_player(number)
    prompt_init_player_name(number)
    name = gets.chomp
    prompt_init_player_marker(name)
    symbol = gets.chomp
    Player.new(name, symbol)
  end

  def swap_turn
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
end

g = Game.new
g.play
