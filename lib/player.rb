require 'pry'

class Player
  attr_accessor :name, :life_points, :player
  def initialize(name)
    @name=name
    @life_points = 10 #j'ai monté un peu parce que faut pas déconner quand même
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
    puts "Il/Elle lui inflige #{damage_inflicted} points de dommages"
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

#-----------------Version2-------------------#

class HumanPlayer
  attr_accessor :weapon_level, :name, :life_points
  def initialize(name)
    @weapon_level=1
    @name=name
    @life_points=100
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def gets_damage(damage)
    @life_points-=damage
    if @life_points <= 0
      return ("#{@name} est mort(e)")
    end
  end

  def is_alive
    if self.life_points > 0
      return true
    else
      return false
    end
  end

  def attacks(player_attacked)
    puts "#{self.name} attaque #{player_attacked.name}"
    damage_inflicted = compute_damage
    puts "Il lui inflige #{damage_inflicted} points de dommages"
    puts player_attacked.gets_damage(damage_inflicted)
  end

  def search_weapon
    new_weapon = rand(1..6)
    if new_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level=new_weapon
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    new_pack = rand(1..6)
    if new_pack==1
      return "Tu n'as rien trouvé.."
    elsif new_pack >= 2 && new_pack <= 5
      self.life_points+=50
      return "Bravo, tu as trouvé un pack de +50 points de vie !"
    else 
      self.life_points+=80
      return "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end

#-----------------Version3-------------------#