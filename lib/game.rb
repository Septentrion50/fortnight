require_relative './player'

# a game of octogon
class Game

  attr_accessor :enemies, :human_player

  def banner
    puts '-------------------------------------------------'
    puts "| Bienvenue dans l'Octogone jeune entrepreneur |"
    puts "|     Il ne doit en rester qu'un : FIGHT !     |"
    puts '-------------------------------------------------'
    puts %q(
                      ______
                    / —————— \\
                   //        \\\
                  //   33333  \\\
                 ||      33    ||
                 ||     3333   ||
                 ||        33  ||
                 \\\       33   //
                  \\\  33333   //
                   \\\ ______ //
                      —————— 
           )
  end

  def initialize(hero_name)
    @enemies = generate_player
    @human_player = HumanPlayer.new(hero_name)
  end

  def enemies_attack
    if @enemies.any? { |x| x.life_points.positive? }
      puts "Les autres joueurs t'attaquent !"
    end
    @enemies.each do |e|
      if e.life_points.positive?
        e.attacks(@human_player)
      end
    end
  end

  def play
    while @human_player.life_points.positive? && @enemies.any? { |x| x.life_points.positive? }
      puts
      @human_player.show_state
      @human_player.control_human(enemies)
      enemies_attack
    end

    if @human_player.life_points.positive?
      puts 'Bravo ! Tu as gagné !'
    else
      puts "T'as perdu !"
    end
  end

  def generate_player(num = 4)
    arr = []
    firstnames = ['JCVD', 'Chuck', 'Bruce', 'Jackie', 'Jet', 'Jason', 'John', 'Sylverser', 'Daniel', 'Pierce', 'Timoty', 'Toshiro', 'Jean', 'Lino']
    num.times do
      p = Player.new(firstnames.sample)
      arr << p
    end
    arr
  end

  def still_ungoing?
    return true if @human_player.life_points.positive?

    false
  end
end
