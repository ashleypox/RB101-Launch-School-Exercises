puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip = gets.chomp.to_f

tip_percent = tip / 100

total_tip = bill * tip_percent
total_bill = bill + total_tip

puts "The tip is $#{total_tip}"
puts "The total is $#{total_bill}"
