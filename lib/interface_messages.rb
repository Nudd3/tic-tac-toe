# frozen_string_literal: true

require 'colorize'

# Messages to show in the terminal
module InterfaceMessages
  def intro_message
    puts "\nWelcome! Let's play some tic tac toe\n\n"
  end

  def init_player_name_message(number)
    print "Input name of player ##{number}: "
  end

  def init_player_symbol_message(name)
    print "Choose symbol for #{name} (letters only): "
  end

  def whos_turn_message(name)
    print "It's #{name}'s turn to play: "
  end

  def winner_message(player)
    print "Congratulations #{player.name}, you won!".yellow
  end

  def draw_message
    print "It's a draw..."
  end

  def input_out_of_bounds_message
    'Input needs to be between 1 - 9'
  end

  def spot_taken_message
    puts 'That spot is already taken'
  end
end
