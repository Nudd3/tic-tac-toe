# frozen_string_literal: true

# Module for printing messages to the prompt
module InterfaceMessages
  def prompt_init_player_name(number)
    print "Input name of player ##{number}: "
  end

  def prompt_init_player_marker(name)
    print "Choose marker for #{name} (letters only): "
  end
end
