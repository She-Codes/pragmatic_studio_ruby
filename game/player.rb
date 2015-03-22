require_relative 'treasure_trove'
class Player
  attr_reader :name, :health
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def strong?
    @health > 100
  end

  def score
    @health + points
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def <=>(other_player)
    other_player.score <=> score
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{name}'s treasures: #{@found_treasures}"
  end

  def each_found_treasure
    @found_treasures.each do |k, v|
      yield Treasure.new(k, v)
    end
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  #not needed when using CSV library
  def self.from_csv(string)
    name, health = string.split(',')
    Player.new(name, Integer(health))
  end
end

if __FILE__ == $0
  player = Player.new("moe", 125)
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
  puts player
end