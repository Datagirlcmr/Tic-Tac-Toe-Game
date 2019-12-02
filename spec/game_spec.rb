# frozen_string_literal: true

require_relative './../bin/game.rb'
require_relative './../lib/board.rb'
require_relative './../lib/player.rb'

RSpec.describe Game do
  describe '#initialize' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(1, 'Selly', 'O') }
    let(:game) { Game.new(player1, player2) }
    it 'return Amadou for game.player1.name' do
      expect(game.player1.name).to eql('Amadou')
    end
  end
  describe '#a_win?' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(1, 'Selly', 'O') }
    let(:game) { Game.new(player1, player2) }
    it 'return true if It is a win' do
      game.board.moves[0] = 'X'
      game.board.moves[1] = 'X'
      game.board.moves[2] = 'X'
      expect(game.a_win?).to eql(true)
    end

    it 'return false as It is not a win' do
      game.board.moves[0] = 'X'
      game.board.moves[1] = '0'
      game.board.moves[2] = 'X'
      expect(game.a_win?).to eql(false)
    end
  end

  describe '#move_ok?' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(1, 'Selly', 'O') }
    let(:game) { Game.new(player1, player2) }
    it 'return true if the move is available' do
      expect(game.move_ok?(1)).to eql(true)
    end
    it 'return false if the move is not available' do
      expect(game.move_ok?(10)).to eql(false)
    end
  end

  describe '#turn' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(1, 'Selly', 'O') }
    let(:game) { Game.new(player1, player2) }
    it 'Return Player2 if the current player number is Player1 number' do
      game.player = player1
      expect(game.turn).to eql(player2)
    end
  end

  describe '#draw?' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(1, 'Selly', 'O') }
    let(:game) { Game.new(player1, player2) }

    it 'returns true if the game is a draw' do
      game.board.moves = %w[X O X X O O O X X]
      expect(game.draw?).to eql(true)
    end
  end

  describe '#errors' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(1, 'Selly', 'O') }
    let(:game) { Game.new(player1, player2) }

    it 'returns an error code not found message' do
      expect(game.errors('x')).to eql('Oops! error code not found!')
    end

    it 'returns an error message' do
      expect(game.errors('invalid_num')).to eql("Sorry. Your move is not available. Please try again \n")
    end
  end

  # describe '#game_end' do
  # end
end
