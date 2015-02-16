class AmountGenerator
  attr_reader :amount

  def generate
    rand_num = rand(1..10)
    @amount = 100 * rand_num 
  end
end
 