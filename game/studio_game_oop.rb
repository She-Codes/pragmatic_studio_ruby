require_relative 'game'

game1 = Game.new('Super Smurfs')

game1.load_players(ARGV.shift || 'players.csv')

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    game1.play(answer.to_i) do
      game1.total_points >= 2000
    end
  when 'quit', 'exit'
    game1.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

game1.save_high_scores



#puts player1.inspect

