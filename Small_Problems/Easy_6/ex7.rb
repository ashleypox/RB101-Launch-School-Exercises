def halvsies(arr)
  if arr.length.odd? 
    half = (arr.length / 2) + 1
  else
    half = arr.length / 2
  end

  first_half = []
  second_half = []
  index = 0

  arr.each do |num|
    if index < half 
      first_half << num
      index += 1
    else
      second_half << num
    end
  end

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]