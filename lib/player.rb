require 'pry'

class Player
  attr_accessor :name, :life_points, :player
  def initialize(name)
    @name=name
    @life_points=10
  end
  
  def show_state
    return("#{@name} à #{@life_points} points de vie")
  end

  def gets_damage(damage)
    @life_points-=damage
    if @life_points <= 0
      return ("#{@name} est mort(e)")
    end
  end
  
  def compute_damage
    return rand(1..6)
  end

  def attacks(player_attacked)
    puts "#{self.name} attaque #{player_attacked.name}"
    damage_inflicted = compute_damage
    puts "Il lui inflige #{damage_inflicted} points de dommages"
    puts player_attacked.gets_damage(damage_inflicted)
  end

  def is_alive
    if self.life_points > 0
      return true
    else
      return false
    end
  end



end
