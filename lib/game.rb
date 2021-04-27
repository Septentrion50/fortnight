require_relative 'player'
require 'pry'

class Game
  attr_accessor :human_player, :ennemies
  
  def initialize(human_player)
    @human_player = HumanPlayer.new(human_player)
    arr = []
    for i in 1..4
      arr << Player.new("ennemies#{i}")
    end
    @ennemies = arr
    puts arr
  end
  
  def kill_player(player)
    j=0
    for i in 0..(3-j)
      begin
        if self.ennemies[i].name == player #nom d'un ennemi = argument
          player = self.ennemies[i]
          self.ennemies.delete(player)  #l'array est ici self.ennemies
        end
      rescue NoMethodError => e #message de rescue car ca bugue au niveau du if
      end
    end
    j+=1
  end

  def is_still_ongoing?
    if self.human_player.life_points>0 && @ennemies != []
      return true
    else 
      return false
    end
  end
  
  def show_players
    puts "Il te reste #{self.human_player.life_points} points de vie"
    puts "Il reste #{self.ennemies.length} ennemies"
  end
  
  def menu
    return 1
  end
 

end

binding.pry
