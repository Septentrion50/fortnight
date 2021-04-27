require 'pry'

# a player
class Player

  @@all_players = []

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
    @@all_players << self
  end

  def show_state
    state = "#{@name} a #{@life_points} points de vie"
    # puts state
    state
  end

  def gets_dammage(dam)
    @life_points -= dam
    if @life_points <= 0
      @life_points = 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(other_player)
    dam = compute_damage
    puts "#{@name} inflige #{dam} points de dommages à #{other_player.name}"
    other_player.gets_dammage(dam)
  end

  def compute_damage
    rand(1..6)
  end

  def self.all_players
    @@all_players.reject { |x| x.life_points <= 0 }
  end
end

# a human player
class HumanPlayer < Player

  attr_accessor :life_points, :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state
    state = "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    puts state
    #state
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice > @weapon_level
      puts 'Cette arme est supérieure, tu la prends !'
      @weapon_level = dice
    else
      puts 'Himmelkreuzdonnerwetter! Cette arme ne vaut rien !'
    end
  end

  def search_health_pack
    case rand(1..6)
    when 1
      puts "Tu n'as rien trouvé..."
    when 2..5
      puts 'Tu as trouvé un pack de 50 points de vie !'
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
    when 6
      puts 'Tu as trouvé un pack de 80 points de vie !'
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end

  def control_human(enemies)
    puts 'Quelle action veux-tu effectuer ?'
    puts 'a - chercher une meilleure arme'
    puts 's - se soigner'
    puts
    puts 'attaquer un joueur en vue :'
    alive = enemies.reject { |x| x.life_points.zero? }
    alive.each_with_index do |i, index|
      puts "#{index} - #{i.show_state}"
    end
    puts

    action = gets.chomp

    if action == 'a'
      search_weapon
    elsif action == 's'
      search_health_pack
    elsif action.match?(/\d/)
      attacks(alive[action.to_i])
    end
  end
end

