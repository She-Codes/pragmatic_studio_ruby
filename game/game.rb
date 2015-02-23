require_relative 'game_turn'

class Game
  attr_reader :title, :players

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(*player)
    @players += player
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}:"
    puts @players
  
    1.upto(rounds) do |round|
      puts "\nRound: #{round}\n"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
        puts
      end
    end
  end

  def print_stats
    strong_players, weak_players = @players.partition{|p| p.strong?}
    sorted_players = @players.sort{|p1, p2| p2.score <=> p1.score}

    puts "\n#{@title} Statistics\n"
    puts "Strong Players:"
    strong_players.each do |p|
      puts "#{p.name} (#{p.health})"
    end
    puts
    puts "Weak Players:"
    weak_players.each do |p|
      puts "#{p.name} (#{p.health})"
    end

    puts "\n#{@title} High Scores:\n"
    sorted_players.each do |p|
      puts "#{p.name.ljust(20, '.')} #{p.score}"
    end
  end
end