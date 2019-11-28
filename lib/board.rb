# frozen_string_literal: true

class Board
  attr_accessor :moves
  def initialize
    @moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @starsline = '************************'
  end
  def reset 
    @moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def available?(index)
    return true if @moves[index].is_a?(Integer)

    false
  end

  def availables
    r = ''
    (0...@moves.size).each do |i|
      r += "#{i + 1} - " if @moves[i].is_a?(Integer)
    end
    r
  end

  def is_full?
    
    if @moves.none?(Integer)
        return true
    end    
    false
  end

  def display
    lineblock = '================='
    linebreak = '----+----+-----+'
    line1 = ''
    line2 = ''
    line3 = ''
    (0..2).each do |x|
      line1 +=  "| #{@moves[x]} |"
             
    end
    (3..5).each do |x|
      line2 += "| #{@moves[x]} |"
    end
    (6..8).each do |x|
      line3 += "| #{@moves[x]} |"
    end
    display = ''
    display += "\n"
    display += lineblock + "\n"
    display += line1 + "\n"
    display += linebreak + "\n"
    display += line2 + "\n"
    display += linebreak + "\n"
    display += line3 + "\n"
    display += lineblock + "\n"
    display += "\n"
    display
  end

  def start_display(player1,player2)
    display = ''    
    display += "\n"
    display += @starsline + "\n"
    display += "*** #{player1.name} #{player1.wins} VS #{player2.name} #{player2.wins} ***" + "\n"
    display += @starsline + "\n"
    display += "\n"
  end
  
  def win_display(winner,player1,player2)
    display = ''
    display += "\n"
    display += @starsline * 2 + "\n"
    display += "****  HURRAY #{winner.name.upcase}. YOU ARE THE WINNER!  ****" + "\n"
    display += @starsline * 2 + "\n"
    display += "\n"
  end

  def draw_display
    display = ''
    
    display += "\n"
    display += @starsline * 2 + "\n"
    display += "****  IT'S A DRAW! ****" + "\n"
    display += @starsline * 2 + "\n"
    display += "\n"
  end
end
