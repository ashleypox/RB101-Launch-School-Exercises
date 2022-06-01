def transpose(arr_of_arrs)
  new_arr = arr_of_arrs.flatten
  new_arr[1], new_arr[3] = new_arr[3], new_arr[1]
  new_arr[2], new_arr[6] = new_arr[6], new_arr[2]
  new_arr[5], new_arr[7] = new_arr[7], new_arr[5]

  [new_arr[0..2], new_arr[3..5], new_arr[6..9]]
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]