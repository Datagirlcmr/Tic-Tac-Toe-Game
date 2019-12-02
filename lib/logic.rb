# frozen_string_literal: true

require_relative './../lib/board.rb'
class GameLogic

  def turn(player, player1, player2)
     if player.number == player1.number
        player2
     else
        player1
    end
  end

  def move_ok?(num, board)
    if num >= 0 && num <= 8
      num_ok = board.available?(num)
      return true if num_ok
    end
    false
  end

  def draw?(playing, board)
    
    return true if playing && board.full?

    false
  end

  def a_win?(board)
    wins = []
    wins << board.moves[0].to_s + board.moves[1].to_s + board.moves[2].to_s
    wins << board.moves[3].to_s + board.moves[4].to_s + board.moves[5].to_s
    wins << board.moves[6].to_s + board.moves[7].to_s + board.moves[8].to_s
    wins << board.moves[0].to_s + board.moves[3].to_s + board.moves[6].to_s
    wins << board.moves[1].to_s + board.moves[4].to_s + board.moves[7].to_s
    wins << board.moves[2].to_s + board.moves[5].to_s + board.moves[8].to_s
    wins << board.moves[0].to_s + board.moves[4].to_s + board.moves[8].to_s
    wins << board.moves[2].to_s + board.moves[4].to_s + board.moves[6].to_s

    player1_win = 'XXX'
    player2_win = 'OOO'
    wins.each do |x|
      return true if x == player1_win || x == player2_win
    end
    false
    end
end
