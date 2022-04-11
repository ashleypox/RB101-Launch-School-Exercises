x = 42

if x > 10 && x < 100
  puts "#{x} lies between 10 and 100."
else
  puts "#{x} does not lie between 10 and 100."
end

# or

(10..100).cover?(42)