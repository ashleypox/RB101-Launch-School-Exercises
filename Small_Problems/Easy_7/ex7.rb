def show_multiplicative_average(arr)
  result = 1

  arr.each do |int|
    result *= int
  end

  num = (result.to_f / arr.length).round(3)
  puts "The result is #{num}"  
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667