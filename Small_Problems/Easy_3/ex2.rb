def all_operations(x, y)
  puts "#{x} + #{y} = #{x+y}"
  puts "#{x} - #{y} = #{x-y}"
  puts "#{x} * #{y} = #{x*y}"
  puts "#{x} / #{y} = #{x/y}"
  puts "#{x} % #{y} = #{x%y}"
  puts "#{x} ** #{y} = #{x**y}"
end

puts "==> Enter the first number:"
answer1 = gets.chomp.to_i

puts "==> Enter the second number:"
answer2 = gets.chomp.to_i

all_operations(answer1, answer2)


