require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

josiane = Player.new('josiane')
jose = Player.new('josé')

while josiane.life_points > 0 && jose.life_points > 0 
  puts "Voici l'état de chaque joueur :"
  josiane.show_state
  jose.show_state
  puts

  puts "Passons à la phase d'attaque :"
    if josiane.life_points > 0
      josiane.attacks(jose)
    end
    if jose.life_points > 0
      jose.attacks(josiane)
    end
end

puts 'Le combat est terminé'
Player.all_players.each do |p|
  puts "#{p.name} wins"
end

binding.pry
