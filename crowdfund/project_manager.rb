require_relative 'project_adjuster'

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
    end

    @projects.compact!
  end

  def manage_projects
    @projects.each do |project|
      ProjectAdjuster.adjust(project)
    end
  end

end