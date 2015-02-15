require_relative 'project'

describe Project do
  before do
    @initial_goal = 600 
    @project = project = Project.new("Hanabar's", @initial_goal)
    $stdout = StringIO.new
  end

  it "sets the goal amount to whatever amount is passed in" do
    expect(@project.goal).to eq(600)
  end

  it "computes the total funding outstanding as the goal amount minus the funding amount" do
    expect(@project.funding_still_needed).to eq(@initial_goal - 0)
  end

  it "increases funds by 25 when funds are added" do
    @project.add_funds
    expect(@project.funding).to eq(25)
  end

  it "decreases funds by the amount entered when funds are removed" do
    amount_to_decrease = 10
    @project.add_funds
    @project.decrease_funds(amount_to_decrease)
    expect(@project.funding).to eq(15)
  end

  it "has a default value of 0 for funding amount" do
    expect(@project.funding).to eq(0)  
  end
end