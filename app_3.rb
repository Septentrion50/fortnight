require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


puts 'Quel est ton nom ?'
name = gets.chomp

new_game = Game.new(name)

new_game.banner
new_game.play
