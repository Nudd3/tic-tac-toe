# frozen_string_literal: false

require 'colorize'

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
  end

  describe '#play' do
    it 'shows the board' do
      allow(game).to receive(:set_up)
      allow(game).to receive(:take_turns)
      allow(game).to receive(:finishing)
      expect(game.board).to receive(:print_board)
      game.play
    end
  end
end
