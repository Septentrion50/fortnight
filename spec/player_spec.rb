require_relative '../lib/player'

describe 'Test the player class' do

  describe 'Test the creation of instances and methods' do

    it 'Test a player named José' do
      player1 = Player.new('José')
      expect(player1.show_state).to eq('José a 10 points de vie')
    end

    it 'Test another player named René' do
      player2 = Player.new('René')
      expect(player2.show_state).to eq('René a 10 points de vie')
    end

    it 'Test the class variable all_players' do
      var = Player.all_players
      expect(var).to be_a_kind_of(Array)
      expect(var[0].name).to eq('José')
      expect(var[1].name).to eq('René')
    end

    it 'Test the attack instance method' do
      player1 = Player.new('José')
      player2 = Player.new('René')
      player1.attacks(player2)
      expect(player2.life_points).to be_between(4, 9)
    end
  end
end
