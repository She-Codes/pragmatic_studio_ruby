require_relative 'project'
require_relative 'amount_generator'

module ProjectAdjuster
  def self.adjust(project)
    amt = AmountGenerator.new.generate
    rand_num = number_generator
    if rand_num == 1
      project.decrease_funds(amt)
    else
      project.add_funds(amt)
    end
  end

  def self.number_generator
    rand(1..2)
  end
end