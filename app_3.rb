require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


puts 'Quel est ton nom ?'
name = gets.chomp
puts

new_game = Game.new(name)

new_game.banner

while true
  is_go = new_game.still_ongoing?
  if !is_go
    break
  end
end
