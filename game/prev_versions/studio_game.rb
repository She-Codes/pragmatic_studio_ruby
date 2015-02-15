player1 = "larry"
health1 = 60
player2 = "curly"
health2 = 125
player3 = "moe"
health3 = 100
player4 = "shemp"
health4 = 90

# puts "#{player1}'s health is #{health1 / 9.0}"

# puts "Players: \n\t#{player1}\n\t#{player2}\n\t#{player3}"

# puts "#{player1.capitalize} has a health of #{health1}."

# puts "#{player2.upcase} has a health of #{health2}."

# health2 = health1

# puts "#{player2.upcase} has a health of #{health2}."

# puts health1.object_id
# puts health2.object_id

puts "#{player3.capitalize} has a health of #{health3}".center(50, '*')

puts "#{player4.capitalize.ljust(30, '.')}#{health4} health"

puts "The game started on #{Time.new.strftime("on %A %m/%d/%Y at %l:%M%p")}."

