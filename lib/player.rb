# frozen_string_literal: true

require 'colorize'

# class representing a player
class Player
  attr_reader :name, :symbol

  @@nr_of_players = 0

  def initialize(name, symbol)
    @name = name
    @symbol = @@nr_of_players.even? ? symbol.red : symbol.green
    @@nr_of_players += 1
  end
end
