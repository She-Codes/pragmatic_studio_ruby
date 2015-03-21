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
      if block_given?
        break if yield
      end
      
      puts "\nRound: #{round}\n"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
        puts
      end
    end

    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.length} to be found: \n"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points}"
    end

  end

  def total_points
    @players.reduce(0) do |s, v|
      s + v.points
    end
  end

  def print_stats
    strong_players, weak_players = @players.partition{|p| p.strong?}

    puts "\n#{@title} Statistics\n"
    
    @players.sort.each do |p|
      puts "\n#{p.name}'s point totals:"
      p.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "\n#{p.points} grand total points"
    end
    puts "\nTotal treasure points found during the game: #{total_points}\n"
    puts "Strong Players:"
    print_name_and_health(strong_players)
    puts
    puts "Weak Players:"
    print_name_and_health(weak_players)

    puts "\n#{@title} High Scores:\n"
    @players.sort.each do |p|
      puts "#{p.name.ljust(20, '.')} #{p.score}"
    end

  end

  private

  def print_name_and_health(arr)
    arr.each do |p|
      puts "#{p.name} (#{p.health})"
    end
  end
end