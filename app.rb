# Que faut-il pour faire un combat ? Moi j'ai en tête qu'il faut a minima :

# 2 joueurs ;
# Que chaque joueur ait un niveau de vie donné ;
# Que ce niveau de vie baisse à chaque attaque subie ;
# Si la vie atteint zéro, le personnage est mort.

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " "
puts " ****************************************************"
puts " | BIENVENUE A LA FINALE ! Mais qui va l'emporter ? |"
puts " ****************************************************"
puts " "
player1 = Player.new("Ingrid")
puts "À ma droite #{player1.name}"
player2 = Player.new("Mathilde")
puts "À ma gauche #{player2.name}"
puts " "
puts " "

while player1.life_points > 0 && player2.life_points >0
puts "Voici l'état de chaque joueur :"
puts "-----------------------------"
puts "#{player1.show_state}"
puts "#{player2.show_state}"
puts " "
puts " "
puts "Passons à l'attaque :"
puts "-----------------------------"
puts "#{player1.attacks(player2)}"
if player2.life_points <= 0 || player1.life_points <= 0
  break
end 
puts "#{player2.attacks(player1)}"

end

binding.pry