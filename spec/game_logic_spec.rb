# frozen_string_literal: true

require_relative './../lib/game_logic.rb'
require_relative './../lib/board.rb'
require_relative './../lib/player.rb'

RSpec.describe GameLogic do
  describe '#a_win?' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(2, 'Selly', 'O') }
    let(:logic) { GameLogic.new }
    let(:board) { Board.new }
    it 'return true if It is a win' do
      board.moves[0] = 'X'
      board.moves[1] = 'X'
      board.moves[2] = 'X'
      expect(logic.a_win?(board)).to eql(true)
    end

    it 'return false as It is not a win' do
      board.moves[0] = 'X'
      board.moves[1] = '0'
      board.moves[2] = 'X'
      expect(logic.a_win?(board)).to eql(false)
    end
  end

  describe '#move_ok?' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(2, 'Selly', 'O') }
    let(:logic) { GameLogic.new }
    let(:board) { Board.new }
    it 'return true if the move is available' do
      expect(logic.move_ok?(1, board)).to eql(true)
    end
    it 'return false if the move is not available' do
      expect(logic.move_ok?(10, board)).to eql(false)
    end
  end

  describe '#turn' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(2, 'Selly', 'O') }
    let(:logic) { GameLogic.new }
    it 'Return Player2 if the current player number is Player1 number' do
      player = player1
      expect(logic.turn(player, player1, player2)).to eql(player2)
    end

    it 'Return Player1 if the current player number is Player2 number' do
      player = player2
      expect(logic.turn(player, player1, player2)).to eql(player1)
    end
  end

  describe '#draw?' do
    let(:player1) { Player.new(1, 'Amadou', 'X') }
    let(:player2) { Player.new(2, 'Selly', 'O') }
    let(:logic) { GameLogic.new }
    let(:board) { Board.new }

    it 'returns true if the game is a draw' do
      board.moves = %w[X O X X O O O X X]
      playing = true
      expect(logic.draw?(playing, board)).to eql(true)
    end
    it 'returns false if the game is not a draw' do
      board.moves = [1,2,3,"X","O","X",7,8,9]
      playing = true
      expect(logic.draw?(playing, board)).to eql(false)
    end
  end
end
