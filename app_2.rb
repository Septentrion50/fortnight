require 'bundler'
Bundler.require

require_relative 'lib/player'


puts"-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts"-------------------------------------------------"

print "Enter your name\n > "
name_users = gets.chomp
player1 = HumanPlayer.new(name_users)
print "Cool! Let's start! You are 'player1'"
binding.pry
