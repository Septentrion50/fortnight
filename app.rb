require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("josiane")
player2 = Player.new("josé")

#/------------------Bienvenue dans the Best Game Ever---------------\#
i=0
while (player1.is_alive && player2.is_alive)
  i+=1
  puts "\nVoici l'état de chaque joueur au round #{i}"

  puts player1.show_state 
  puts player2.show_state

  puts "Passons à la phase d'attaque :"
  #attaque fulgurante de José
  player2.attacks(player1)
  # magnifique réplique de Josiane
  player1.attacks(player2)
  
end

binding.pry