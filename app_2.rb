require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

def banner
  puts '-------------------------------------------------'
  puts "| Bienvenue dans l'Octogone jeune entrepreneur |"
  puts "|     Il ne doit en rester qu'un : FIGHT !     |"
  puts '-------------------------------------------------'
  puts %q(
                    ______
                  / —————— \\
                 //        \\\
                //          \\\
               ||            ||
               ||            ||
               ||            ||
               \\\            //
                \\\          //
                 \\\ ______ //
                    —————— 
         )
end

banner

enemies = []
josiane = Player.new('Josiane')
jose = Player.new('Jose')
enemies << josiane
enemies << jose

hero = HumanPlayer.new('Hero')

while hero.life_points > 0 && (josiane.life_points > 0 || jose.life_points > 0)
  puts
  hero.show_state
  hero.control_human(enemies)
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |e|
    if e.life_points > 0
      e.attacks(hero)
    end
  end
end

if hero.life_points > 0
  puts 'Bravo ! Tu as gagné !'
else
  puts "T'as perdu !"
end
