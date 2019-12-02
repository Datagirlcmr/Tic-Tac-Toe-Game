# frozen_string_literal: true

require_relative './../lib/player.rb'

RSpec.describe Player do
  describe '#initialize' do
    let(:player) { Player.new(1, 'Amadou', 'X') }
    it 'return Amadou if the player name is Amadou' do
      expect(player.name).to eql('Amadou')
    end
  end
end
