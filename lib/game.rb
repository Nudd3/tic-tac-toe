# frozen_string_literal: true

require 'pry'
require 'colorize'

require_relative 'board'
require_relative 'player'

# game class
class Game
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

  def set_up
    puts "\nWelcome! Let's play some tic tac toe\n\n"
    init_players
  end

  def init_players
    @player_one = create_player(1)
    @player_two = create_player(2)
    @current_player = player_one
  end

  def create_player(number)
    print "Input name of player ##{number}: "
    name = gets.chomp
    print "Choose symbol for #{name} (letters only): "
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
    print "It's #{player.name}'s turn to play: "
    user_input = gets.chomp
    if input_valid?(user_input)
      board.set_coordinate(user_input.to_i, current_player.symbol)
    else
      turn(player)
    end
  end

  def input_valid?(user_input)
    unless in_bounds?(user_input)
      puts 'Input needs to be between a digit 1 - 9'
      return false
    end

    unless spot_available?(user_input)
      puts 'That spot is already taken'
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
    puts board.winner? ? "Congratulations #{current_player.name}, you won!\n".yellow : "It's a draw..."
  end
end
