require_relative 'project_manager'
require 'pry'

project1 = Project.new('Overthrow', 200, 50000)
project2 = Project.new('Let\'s Go!', 75000)
project3 = Project.new('Beast Tamers', 15000)

startups = ProjectManager.new('VC-Friendly Startup Projects')
startups.add_projects(project1, project2, project3)
startups.manage_projects
startups.evaluate_progress!
binding.pry

puts startups.projects

