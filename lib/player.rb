# frozen_string_literal: true

class Player
  attr_reader :number, :name, :symbol, :wins
  attr_writer :wins
  def initialize(number, name = nil, symbol = nil)
    @number = number
    @name = name
    @wins = 0
    @symbol = symbol
  end
end
