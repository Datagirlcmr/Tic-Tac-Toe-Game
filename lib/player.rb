# frozen_string_literal: true

class Player
  attr_reader :number, :name, :symbol

  def initialize(number, name = nil)
    @number = number
    @name = name
    @symbol = if number == 1
                'X'
              else
                'O'
              end
  end
end
