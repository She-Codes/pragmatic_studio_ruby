module ProjectCleaner
  def self.clean(arr)
    empty_slots = arr.select { |p| p == nil }
    if empty_slots.empty?
      puts "Good news! All projects are meeting at least 1% of their goal."
    end

    arr.compact!
  end
end