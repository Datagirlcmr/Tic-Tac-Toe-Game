require_relative './../bin/game.rb'
require_relative  "./../lib/board.rb"
require_relative  "./../lib/player.rb"

player1= Player.new(1,"Amadou","X")
player2 = Player.new(1,"Selly","O")
game = Game.new(player1, player2)

RSpec.describe Game do
    let(:player1){ player1 }
    let(:player2){ player2 }
    let(:game) { game }

    describe '#a_win?' do
      it 'return true if It is a win' do        
        game.board = Board.new
        game.board.moves[0]="X"
        game.board.moves[1]="X"
        game.board.moves[2]="X"
        expect(game.a_win?).to eql(true)
      end

      it 'return false as It is not a win' do        
        game.board = Board.new
        game.board.moves[0]="X"
        game.board.moves[1]="0"
        game.board.moves[2]="X"
        expect(game.a_win?).to eql(false)
      end
      
    end

    describe '#move_ok?' do
        game.board = Board.new
        
        it "return true if the move is available" do
        expect(game.move_ok?(1)).to eql(false)
        end
        it "return false if the move is not available" do
            expect(game.move_ok?(10)).to eql(false)
        end
    end

    describe '#turn' do
        game.player = player1
        it "Return Player2 if the current player is Player1" do
            expect(game.turn).to eql(player2)
        end
    end


  end