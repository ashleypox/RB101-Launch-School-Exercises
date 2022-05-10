def interleave(arr1, arr2)
  total_size = arr1.length + arr2.length
  index = 0
  new_arr = []

  loop do 
    new_arr.push(arr1[index], arr2[index])
    index += 1
    break if new_arr.size == total_size
  end

  new_arr.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']