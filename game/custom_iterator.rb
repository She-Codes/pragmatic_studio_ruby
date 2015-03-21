def n_times(number)
  1.upto(number) do |i|
    yield(i)
  end
end

n_times(10) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end