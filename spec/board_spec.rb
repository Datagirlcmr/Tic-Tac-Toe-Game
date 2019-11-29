require './lib/board.rb'

RSpec.describe Board do
  describe '#available?' do
    it 'return true if the move is available' do
      board = Board.new
      expect(board.available?(4)).to eql(true)
    end
  end
end
