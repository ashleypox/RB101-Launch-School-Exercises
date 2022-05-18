def no_r_fibonacci(num)
    f_arr = [1, 1]

    loop do
      f_arr.append(f_arr[-1] + f_arr[-2])
      break if f_arr.length >= num
    end

    f_arr[num-1]
end

def fibonacci(num)
  return 1 if num <= 2
  fibonacci(num-1) + fibonacci(num-2)
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765