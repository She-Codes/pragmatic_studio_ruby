require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title, :players

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(*player)
    @players += player
  end

  def play
    puts "There are #{@players.length} players in #{@title}:"
    puts @players
    puts
    @players.each do |player|
      die = Die.new

      case die.roll
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.w00t
      end
      puts player
      puts
    end
  end
end