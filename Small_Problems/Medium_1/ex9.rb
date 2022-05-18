def fibonacci(num)
  f_arr = [1, 1]

  loop do
    f_arr.append(f_arr[-1] + f_arr[-2])
    break if f_arr.length >= num
  end

  f_arr[num-1]
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501