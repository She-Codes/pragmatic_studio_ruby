class Project
  attr_accessor :name
  attr_reader :funding, :goal
  def initialize(name, funding=0, goal)
    @name = name
    @funding = funding
    @goal = goal
  end

  def add_funds(amt)
    @funding += amt
    puts "#{@name} got $#{amt}!"
  end

  def decrease_funds(amt)
    @funding -= amt
    puts "#{@name} lost $#{amt}."
  end

  def funding_still_needed
    @goal - @funding
  end

  def to_s
    "Project #{@name} has $#{@funding} in funding towards a goal of $#{@goal}."
  end
end

if __FILE__ == $0
  project = Project.new('Overthrow', 200, 50000)
  project.add_funds
  project.decrease_funds(10)
  puts project
  puts project.funding_still_needed
end