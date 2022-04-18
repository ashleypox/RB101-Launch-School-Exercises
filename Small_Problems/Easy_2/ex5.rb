def greet_or_scream
  puts "What is your name?"
  name = gets.chomp

  if name.include? "!"
    puts "HELLO #{name.upcase} WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

greet_or_scream
