[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the block's return value is a boolean, determined by the last line in the block
# the return value of any is also a boolean, and it outputs true. It stops running as 
# soon as it finds a truthy value, so it only puts 1. 