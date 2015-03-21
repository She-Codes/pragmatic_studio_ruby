require_relative 'game'

player1 = Player.new("moe", 125)
player2 = Player.new('larry')
player3 = Player.new('curly')
player4 = Player.new('shemp', 90)

game1 = Game.new('Super Smurfs')
game1.add_player(player1, player2, player3, player4)
game1.play(10) do
  game1.total_points >= 2000
end
game1.print_stats


#puts player1.inspect

