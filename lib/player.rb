# frozen_string_literal: true

class Player
  attr_reader :number, :name, :symbol 
    attr_accessor :wins
  def initialize(number, name = nil)
    @number = number
    @name = name
    @wins = 0
    @symbol = if number == 1
                'X'
              else
                'O'
              end
  end
end
