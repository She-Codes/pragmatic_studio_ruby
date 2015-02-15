require_relative 'game'

player1 = Player.new("moe", 125)
player2 = Player.new('larry')
player3 = Player.new('curly')
player4 = Player.new('shemp', 90)

game1 = Game.new('Super Smurfs')
game1.add_player(player1, player2, player3)
game1.play


#puts player1.inspect

