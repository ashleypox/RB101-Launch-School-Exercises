loop do
  puts 'Should I stop looping? Type 'yes' for yes.'
  answer = gets.chomp

  break if answer.downcase == 'yes'
end