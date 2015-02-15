require_relative 'project'

class ProjectManager
  attr_accessor :name, :projects

  def initialize(name)
    @name = name
    @projects = []
  end

  def add_projects(*project)
    @projects += project
  end

  def evaluate_progress!
    #remove project if funding is not 1% of goal
    @projects.map! do |p|
      if p.funding < p.goal * 0.01
        puts "Unfortunately #{p.name} has not been able to meet 1% of it's goal."
        puts "#{p.name} has been removed."
        p = nil 
      else
        p
      end
    end

    empty_slots = @projects.select { |p| p == nil }
    if empty_slots.empty?
      puts "Good news! All projects are meeting at least 1% of their goal."
    else
      puts "Space for #{empty_slots.length} new project#{'s' if empty_slots.length > 1} has become available."
    end

    @projects.compact!
  end

  def manage_projects
    @projects[0].add_funds
    puts @projects[0]
    puts
    @projects[1].add_funds(500)
    @projects[1].add_funds(250)
    puts @projects[1]
    puts
    @projects[2].add_funds(100)
    @projects[2].add_funds(100)
    puts @projects[2]
  end

  def to_s
    puts "#{@name}:"
    puts "#{@projects}"
  end
end