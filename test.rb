require_relative 'lib/player'

def generate_player(num = 4)
  arr = []
  firstnames = ['JCVD', 'Chuck', 'Bruce']
  num.times do |p|
    p = Player.new(firstnames.sample)
    arr << p
  end
  return arr
end

puts generate_player

