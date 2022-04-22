def oddities(arr)
  new_arr = []

  for num in arr
    if arr.index(num).even?
      new_arr << num
    end
  end

  new_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []



