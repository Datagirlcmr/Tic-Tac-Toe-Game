# frozen_string_literal: true

class Board
  attr_accessor :moves
  def initialize
    @moves = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def available?(index)
    return true if @moves[index].nil?

    false
  end

  def availables
    r = ''
    (0...@moves.size).each do |i|
      r += "#{i + 1} - " if @moves[i].nil?
    end
    r
  end

  def free_moves
    return true if @moves.select(&:nil?)
    false
  end

  def display
    lineblock = '================='
    linebreak = '----+----+-----+'
    line1 = ''
    line2 = ''
    line3 = ''
    (0..2).each do |x|
      line1 += if @moves[x].nil?
                 "| #{x + 1} |"
               else
                 "| #{@moves[x]} |"
               end
    end
    (3..5).each do |x|
      line2 += if @moves[x].nil?
                 "| #{x + 1} |"
               else
                 "| #{@moves[x]} |"
               end
    end
    (6..8).each do |x|
      line3 += if @moves[x].nil?
                 "| #{x + 1} |"
               else
                 "| #{@moves[x]} |"
               end
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

  def win_display(player)
    display = ''
    starsline = '************************'
    display += "\n"
    display += starsline * 2 + "\n"
    display += "****  HURRAY #{player.name.upcase}. YOU ARE THE WINNER!  ****" + "\n"
    display += starsline * 2 + "\n"
    display += "\n"
  end
end
