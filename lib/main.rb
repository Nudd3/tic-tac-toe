# frozen_string_literal: true

require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'interface_messages'

def play
  game = Game.new
  game.play
  replay
end

def replay
  puts 'Play again? (y/n)'
  user_input = gets.chomp
  play if user_input == 'y'
end

play
