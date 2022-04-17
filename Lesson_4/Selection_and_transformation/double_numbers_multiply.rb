my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(array, factor)
  new_array = []

  array.each do |number|
    new_array << number * factor
  end

  new_array
end

puts multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]