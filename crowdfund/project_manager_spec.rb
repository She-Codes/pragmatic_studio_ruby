require_relative 'project_manager'

describe ProjectManager do
  before do
    @project1 = Project.new('Legal', 10000)
    @project2 = Project.new('Muffins', 5000)
    @project3 = Project.new('Juggle', 7000)
    @manage1 = ProjectManager.new('Manage1')
    @manage1.add_projects(@project1, @project2, @project3)
    $stdout = StringIO.new
  end

  it "adds a project to the projects array" do
    new_project = Project.new('No Violence', 50000)
    @manage1.add_projects(new_project)

    expect(@manage1.projects).to eq([@project1, @project2, @project3, new_project])
  end

  it "removes projects who have not met at least 1% of their funding goal at the time of evaluation" do
    @project1.add_funds(500)
    @project2.add_funds(500)
    @manage1.evaluate_progress!

    expect(@manage1.projects).to eq([@project1, @project2])
  end

  it "adds money if there is an even number" do
    allow_any_instance_of(AmountGenerator).to receive(:generate).and_return(500)
    allow_any_instance_of(ProjectManager).to receive(:number_generator).and_return(1)
    @project1.add_funds(1000)
    @manage1.manage_projects
    expect(@project1.funding).to eq(500)
  end

  it "deducts money if there is an odd number" do
    allow_any_instance_of(AmountGenerator).to receive(:generate).and_return(500)
    allow_any_instance_of(ProjectManager).to receive(:number_generator).and_return(2)
    @manage1.manage_projects
    expect(@project1.funding).to eq(500)
  end
end