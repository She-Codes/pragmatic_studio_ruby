def time
  Time.new.strftime("%I:%M:%S")
end

def say_hello(name, health=100)
  "I'm #{name.capitalize} and my health is #{health} as of #{time}."
end

puts say_hello('larry', 60)
puts say_hello('curly', 125)
puts say_hello('moe')
puts say_hello('shemp', 90)


