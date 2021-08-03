# frozen_string_literal: true

# 1. Display a welcome message to the prompt
# 2. Take info about players and create them
# 3. Take turns until one of the following happens:
#    - Someone wins
#    - Board is full, i.e., draw

require 'pry'

require_relative 'board'
require_relative 'player'
require_relative 'interface_messages'
# game class
class Game
  include InterfaceMessages

  attr_accessor :player_one, :player_two, :current_player, :board

  def initialize
    @board = Board.new
    @player_one = nil
    @player_two = nil
    @current_player = nil
  end

  def play
    set_up
    board.print_board
    take_turns
    finishing
  end

  private

  # Sets_up the game, showing a message and creating the players
  def set_up
    intro_message
    init_players
  end

  def init_players
    @player_one = create_player(1)
    @player_two = create_player(2)
    @current_player = player_one
  end

  def create_player(number)
    init_player_name_message(number)
    name = gets.chomp
    init_player_symbol_message(name)
    symbol = gets.chomp
    Player.new(name, symbol)
  end

  def take_turns
    until board.full?
      turn(current_player)
      board.print_board
      break if board.winner?

      swap_turn
    end
  end

  def turn(player)
    whos_turn_message(player.name)
    user_input = gets.chomp
    if input_valid?(user_input)
      board.set_coordinate(user_input.to_i, current_player.symbol)
    else
      turn(player)
    end
  end

  def input_valid?(user_input)
    unless in_bounds?(user_input)
      input_out_of_bounds_message
      return false
    end

    unless spot_available?(user_input)
      spot_taken_message
      return false
    end

    true
  end

  def in_bounds?(value)
    value.to_i.between?(1, 9)
  end

  def spot_available?(coordinate)
    board.taken?(coordinate.to_i)
  end

  def swap_turn
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def finishing
    puts board.winner? ? winner_message(current_player) : draw_message
  end
end
