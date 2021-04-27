require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts "                                                ^                                               "
puts "                                              #***#                                             "
puts "                        -------------------------------------------------                       "
puts "                        |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |                       "
puts "                        |Le but du jeu est d'être le dernier survivant !|                       "
puts "                        -------------------------------------------------                       "
puts "                    *        *        *      *       *       *       *       *                         "
puts "        ***     ***     ***     ***     ***     ***     ***     ***     ***     ***    ***      "
puts "                       Let's Start with The Best Motherfucking Game Ever !!!                    "


print "Enter your name\n > "
name_users = gets.chomp
new_game = Game.new(name_users) 
print "Cool! Let's start! You are 'human_player'"

round=0
while new_game.is_still_ongoing?
  puts "Il te reste #{new_game.human_player.life_points} points de vie"
  puts "début du round#{round}"
  new_game.menu
  input = gets.chomp
  puts new_game.menu_choice(input)
  new_game.remove?
  new_game.ennemies_attack #ne pas afficher trop de texte
  round+=1
end

if new_game.human_player.life_points > 0
  puts "Bravo Tu as gagné en même temps c'était vraiment simple"
else
  puts "You Lose Bro!"
end

binding.pry
