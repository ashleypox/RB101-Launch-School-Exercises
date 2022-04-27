def multisum(num)
  array = []
  (1...(num + 1)).each {|i| (array << i) if (i % 3 == 0) || (i % 5 == 0)}
  array.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168