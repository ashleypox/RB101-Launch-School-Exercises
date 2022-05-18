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

def max_rotation(number)
  number_digits = number.to_s.size

  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end

  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845