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

  def take_turns
    until board.full?
      turn(current_player)
      board.print_board
      break if board.winner?

      swap_turn
    end
  end

  # Each turn, a player is to choose where to place his/her symbol
  # Then, a check should be made whether the space is already taken
  # or if the number inputted is out of bounds.
  # Two methods: taken? and outOfBounds
  def turn(player)
    prompt_whos_turn(player.name)
    user_input = gets.chomp
    board.set_coordinate(user_input.to_i, current_player.symbol) unless input_valid?(user_input)
  end

  def init_players
    @player_one = create_player(1)
    @player_two = create_player(2)
    @current_player = player_one
  end

  def create_player(number)
    prompt_init_player_name(number)
    name = gets.chomp
    prompt_init_player_symbol(name)
    symbol = gets.chomp
    Player.new(name, symbol)
  end

  def swap_turn
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end

  def finishing
    puts board.winner? ? winner_message(current_player) : "It's a tie.."
  end
end
