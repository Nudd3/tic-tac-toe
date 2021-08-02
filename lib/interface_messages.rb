# frozen_string_literal: true

# Module for printing messages to the prompt
module InterfaceMessages
  def intro_message
    "Welcome! Let's play some tic tac toe"
  end

  def prompt_init_player_name(number)
    print "Input name of player ##{number}: "
  end

  def prompt_init_player_symbol(name)
    print "Choose symbol for #{name} (letters only): "
  end

  def prompt_illegal_symbol(symbol)
    print "You can not choose #{symbol}"
  end

  def prompt_whos_turn(name)
    print "It's #{name}'s turn to play: "
  end

  def promt_winner(name)
    print "Congratulations #{name}, you won!"
  end

  def prompt_draw
    print "It's a draw!"
  end
end
