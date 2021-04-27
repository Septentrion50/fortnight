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
    self.ennemies.each do |user|
      if user == player #ennemi = argument
        self.ennemies.delete(player)  #l'array est ici self.ennemies
      end
    end
  end

  def is_still_ongoing?
    if self.human_player.life_points>0 && self.ennemies != []
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
    puts "Quelle action veux-tu effectuer ?"
    puts "\na - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "attaquer un joueur en vue :"
    for i in 0..(self.ennemies.length-1)  
      begin
        if self.ennemies[i].life_points > 0  
          puts "#{i} #{self.ennemies[i].show_state}"
        else 
          self.kill_player(ennemies[i])
        end
      rescue NoMethodError =>e
      end
    end
    print"> "
  end
  
  def menu_choice(input)
    if input=="a"
      return human_player.search_weapon
    elsif input == "s"
      return human_player.search_health_pack
    elsif input == "0"
      self.human_player.attacks(self.ennemies[0])
    elsif input == "1"
      self.human_player.attacks(self.ennemies[1])
    elsif input == "2"
      self.human_player.attacks(self.ennemies[2])
    elsif input == "3"
      self.human_player.attacks(self.ennemies[3])
    else
      return "cette commande n'existe pas"
    end
  end

  def remove?
    self.ennemies.each do |ennemi|
      if ennemi.life_points<=0
        kill_player(ennemi)
      end
    end
  end

  def ennemies_attack
    self.ennemies.each do |les_mechants|
      puts les_mechants.attacks(self.human_player)
    end
  end

end

binding.pry