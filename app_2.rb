require 'bundler'
Bundler.require

require_relative 'lib/player'



puts"-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts"-------------------------------------------------"

print "Enter your name\n > "
name_users = gets.chomp
human_player1 = HumanPlayer.new(name_users)
print "Cool! Let's start! You are 'human_player1'"

ennemies=[]
ennemies << player1 = Player.new("josiane") 
ennemies << player2 = Player.new("josé")
puts ennemies

i=0
while human_player1.is_alive && (player1.is_alive || player2.is_alive)
  i+=1
  puts "\n\nRound #{i}"
  puts "Passons à la phase d'actions :"
  puts "Quelle action veux-tu effectuer ?"
  puts "\na - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "attaquer un joueur en vue :"
  puts "0 #{player1.show_state} "
  puts "1 #{player2.show_state} "
  print"> "
  
  input = gets.chomp
  
  if  input == "a"
    p human_player1.search_weapon
  elsif input == "s"
    p human_player1.search_health_pack
  elsif input == "0"
    p human_player1.attacks(player1)
  elsif input == "1"
    p human_player1.attacks(player2)
  else 
    puts "It's not on the menu"
  end
  
  puts "les autres joueurs t'attaquent!"
  ennemies.each do |mechants|
    if mechants.is_alive
      mechants.attacks(human_player1)
    end
  end

end

if human_player1.is_alive
  puts "Bravo Tu as gagné en même temps c'était vraiment simple"
else
  puts "You Lose Bro!"
end

binding.pry
