puts ">> Please enter an integer greater than 0:"
given_int = gets.chomp.to_i
number_range = (1..given_int).to_a

puts "Enter 's' to compute the sum, 'p' to compute the product."
answer = gets.chomp

if answer.downcase == 's'
  sum = number_range.sum

  puts "The sum of the integers between #{number_range[0]} and #{given_int} is #{sum}."
elsif answer.downcase == 'p'
  product = number_range.inject(:*)

  puts "The product of the integers between #{number_range[0]} and #{given_int} is #{product}"
end




