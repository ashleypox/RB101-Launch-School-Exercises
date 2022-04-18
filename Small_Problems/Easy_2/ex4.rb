puts "What is your age?"
current_age = gets.chomp.to_i

puts "When do you want to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year
years_left = retire_age - current_age
retire_year = current_year + years_left


puts "Right now, it's #{current_year}. You will retire in #{retire_year}."
puts "You only have #{years_left} years to go!"


