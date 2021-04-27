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
    @enemies_in_sight = []
    @players_left = 10
    @human_player = HumanPlayer.new(hero_name)
  end

  def enemies_attack
    if @enemies_in_sight.any? { |x| x.life_points.positive? }
      puts "Les autres joueurs t'attaquent !"
    end
    @enemies_in_sight.each do |e|
      if e.life_points.positive?
        e.attacks(@human_player)
      end
    end
  end

  def kill_player
    if @enemies_in_sight.empty?
      return
    else
    @enemies_in_sight.reject! { |x| x.life_points.zero? }
    @players_left -= 1
    end
  end

  def play_turn
    while @human_player.life_points.positive? && @enemies_in_sight.any? { |x| x.life_points.positive? }
      puts
      kill_player
      @human_player.show_state
      @human_player.control_human(@enemies_in_sight)
      enemies_attack
    end
  end

  def new_players_in_sight
    if @players_left == 10 && @enemies_in_sight.size == 10
      puts 'Tous les joueurs sont en vue'
    else
      case rand(1..6)
      when 1
        puts "Aucun joueur adverse n'arrive"
      when 2..5
        generate_player(1)
        puts 'Un joueur adverse arrive !'
      when 6
        generate_player(2)
        puts 'Deux joueurs adverses arrivent !'
      end
    end
  end

  def generate_player(num)
    firstnames = ['JCVD', 'Chuck', 'Bruce', 'Jackie', 'Jet', 'Jason', 'John', 'Sylverser', 'Daniel', 'Pierce', 'Timoty', 'Toshiro', 'Jean', 'Lino']
    num.times do
      p = Player.new(firstnames.sample)
      @enemies_in_sight << p
    end
  end

  def still_ongoing?
    if @human_player.life_points.positive? && @players_left <= 0
      puts 'Bravo ! Tu as gagné !'
      false
    elsif @human_player.life_points.positive? && @players_left.positive?
      new_players_in_sight
      play_turn
      true
    elsif @human_player.life_points.zero?
      puts "T'as perdu !"
      false
    end
  end
end
