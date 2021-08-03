# frozen_string_literal: true

require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'interface_messages'

def play
  game = Game.new
  game.play
end

play
