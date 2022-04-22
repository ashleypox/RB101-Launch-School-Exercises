[1, 2, 3].reject do |num|
  puts num
end

# return value of reject is an array with any values that do not return as true; 
# because puts returns nil, the value is [1, 2, 3]