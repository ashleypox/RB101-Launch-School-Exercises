# calculator
puts "Welcome to calculator!"

#ask the user for two numbers
puts "Enter the first number."
number1 = gets.chomp
puts "Enter the second number."
number2= gets.chomp

#ask the user for operation to perform
puts "What operation should we perform on numbers 1 and 2? 1) add 2) subtract 
3) multiply, or 4) divide."
operation = gets.chomp

#perform the operation on the two numbers
if operation == "1"
  result = number1.to_i + number2.to_i 
elsif operation == "2"
  result = number1.to_i - number2.to_i
elsif operation == "3"
  result = number1.to_i * number2.to_i
elsif operation == "4"
  result = number1.to_f / number2.to_f  
end

#output the result
puts result