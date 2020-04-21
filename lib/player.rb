# require 'pry'

class Player 
# attributs et initialize
  attr_accessor :name, :life_points
  
  def initialize(name)
    @name = name
    @life_points = 10
  end

# afficher l'état d'un joueur avec show_state
  def show_state
    return "#{name} a #{life_points} points de vie"
  end 

# fait subir une attaque à l'un des joueurs 
  def gets_damage(number_of_damages)
    @life_points = @life_points - number_of_damages 
    if @life_points <= 0 
      puts "#{@name} a été tué!" 
    end
  end

  # cette fonction fait s'attaquer deux joueurs 
  def attacks(player_name)
    current_damage = compute_damage 
    puts "#{@name} attaque le joueur #{player_name.name}!"
    player_name.gets_damage(current_damage) 
    puts "#{@name} lui a infligé #{current_damage} points de dommages"
  end

  # cette fonction permet de choisir un chiffre au hasard entre 1 et 6 qui va être utilisée
  # pour attaquer 
  def compute_damage
    return rand(1..6)
  end

end

# To test with pry :
# player1 = Player.new("José")
# player1.name
# player1.life_points
# player1.show_state
# player1.gets_damage(10)
# player1.attacks(player2)


# VERSION 2 

class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
     # j'ai rajouté cette ligne
    super(name)
    @life_points = 20 #fait appel au initialize de la classe Player
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end
  
  def search_weapon
    dé_random_number = rand(1..6)
    new_weapon_level = dé_random_number 
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > self.weapon_level
      new_weapon_level = @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else 
      puts "Dommage.. elle est moins bonne que ton arme actuelle. Retente ta chance !"
    end
  end

  def search_health_pack
    dice_random_number = rand(1..6)
    life_points_won = dice_random_number
    if life_points_won == 1 
      puts "Tu n'as rien trouvé..."
    elsif life_points_won.between?(2, 5) 
      if @life_points <= 50
        @life_points += 50
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      else
        puts "Dommage.. tu ne peux pas dépasser 100 points de vie"
      end
    else life_points_won == 6
      if @life_points <= 20 
        @life_points += 80
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
      else 
        puts "Dommage.. tu ne peux pas dépasser 100 points de vie"
      end
    end
  end

end

# binding.pry

# humanplayer1 = HumanPlayer.new("nicolas")
# humanplayer2 = HumanPlayer.new("virginie")
# humanplayer1.life_points
# humanplayer2.show_state
# humanplayer1.search_weapon
# humanplayer1.attacks(humanplayer2)
# humanplayer1.search_health_pack