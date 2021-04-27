require 'pry'

# a player
class Player

  @@all_players = []

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
    @@all_players << self
  end

  def show_state
    state = "#{@name} a #{@life_points} points de vie"
    puts state
    state
  end

  def gets_dammage(dam)
    @life_points -= dam
    if @life_points <= 0
      @life_points = 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(other_player)
    dam = compute_damage
    puts "#{@name} inflige #{dam} points de dommages à #{other_player.name}"
    other_player.gets_dammage(dam)
  end

  def compute_damage
    rand(1..6)
  end

  def self.all_players
    @@all_players.reject { |x| x.life_points <= 0 }
  end
end

#binding.pry
