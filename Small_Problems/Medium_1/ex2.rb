def rotate_array(array)
  new_arr = []

  array.each do |e|
    new_arr << e unless e == array[0]
  end

  new_arr.push(array[0])
end

def rotate_rightmost_digits(number, num_to_rotate)
  # split into array in same order
  arr = number.digits.reverse

  # split into sub arrays based on num to rotate
  second = arr.last(num_to_rotate)
  first = arr - second

  # rotate just the sub array
  second = rotate_array(second)

  # put back together
  (first + second).join("").to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917