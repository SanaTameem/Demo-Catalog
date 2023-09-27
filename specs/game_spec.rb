require_relative 'spec_helper'

describe Game do
  before :each do
    @game = Game.new('2000/08/11', true, '2020/09/26')
  end

  describe '#new' do
    it 'Returning an instance of the Game class' do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe '#publish_date' do
    it 'Returns the date which game published at' do
      expect(@game.publish_date).to eq('2000/08/11')
    end
  end

  describe '#multiplayer' do
    it 'Returning true if the game is multiplayer' do
      expect(@game.multiplayer).to be_truthy
    end
  end

  describe '#last_played_at' do
    it 'Returns the date which the game last played at' do
      expect(@game.last_played_at).to eq('2020/09/26')
    end
  end

  describe '#can_be_archived?' do
    it 'Returns true if the it is more than 10 years passed of its publishing, otherwise false' do
      expect(@game.can_be_archived?).to be_truthy
      game2 = Game.new('2020/08/11', true, '2020/09/26')
      expect(game2.can_be_archived?).to be_falsy
    end
  end
end
