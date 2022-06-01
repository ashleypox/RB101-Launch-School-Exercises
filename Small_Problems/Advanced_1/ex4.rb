def transpose(arr)
  new_arr = []
  rows = arr.size
  columns = arr.first.size

  (0...columns).each do |c_idx|
    new_row = (0...rows).map { |r_idx| arr[r_idx][c_idx] }
    new_arr << new_row
  end

  new_arr
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]