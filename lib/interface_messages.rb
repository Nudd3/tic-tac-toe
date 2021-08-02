# frozen_string_literal: true

# Module for printing messages to the prompt
module InterfaceMessages
  def prompt_init_player_name(number)
    print "Input name of player ##{number}: "
  end

  def prompt_init_player_marker(name)
    print "Choose marker for #{name} (letters only): "
  end

  def prompt_whos_turn(name)
    print "It's #{name}'s turn to play: "
  end
end
