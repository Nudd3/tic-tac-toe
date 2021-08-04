# frozen_string_literal: true

require_relative 'game'
require_relative 'player'
require_relative 'board'

def play
  game = Game.new
  game.play
  replay
end

def replay
  print 'Play again? (y/n): '
  user_input = gets.chomp
  play if user_input == 'y'
  puts 'Thanks for playing!'
end

play
