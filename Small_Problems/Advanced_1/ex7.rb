def merge(arr1, arr2)
  new_arr = arr1 + arr2
  return_arr = []

  loop do 
    return_arr << new_arr.min
    new_arr.delete_at(new_arr.index(new_arr.min))
    break if new_arr.empty?
  end

  return_arr
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]