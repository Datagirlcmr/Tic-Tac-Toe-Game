# frozen_string_literal: true

require_relative './../lib/board.rb'

RSpec.describe Board do
  describe '#initialize' do
    let(:board) { Board.new }
    it 'return [1,2,3,4,5,6,7,8,9] for the board moves' do
      expect(board.moves).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
  describe '#reset' do
    let(:board) { Board.new }
    it 'return true' do
      board.moves = %w[x o x o x o x o x]
      expect(board.reset).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#available?' do
    let(:board) { Board.new }
    it 'return true if the move is available' do
      expect(board.available?(4)).to be_truthy
    end

    it 'return false if the move is not available' do
      expect(board.available?(25)).to be_falsey
    end
  end

  describe '#availables' do
    let(:board) { Board.new }
    it 'return [1,2,3] for the availables moves' do
      board.moves = [1, 2, 3, 'X', 'O', 'X', 'O', 'x', 'O']
      expect(board.availables).to eq('1 - 2 - 3 - ')
    end

    it 'return empty if there is no moves availables' do
      board.moves = ['x','O','O' 'X', 'O', 'X', 'O', 'x', 'O']
      expect(board.availables).to eq('')
    end
  end

  describe '#full?' do
    let(:boardempty) { Board.new }
    let(:boardfull) { Board.new }

    it 'return true if the board is full' do
      boardfull.moves = %w[x o x o x o x o x]
      expect(boardfull.full?).to be_truthy
    end

    it 'return false if the board is not full' do
      expect(boardempty.full?).to be_falsey
    end
  end
end
