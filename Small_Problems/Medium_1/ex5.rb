def display_diamond(num)
  # create array of odd numbers, ascending then decending from given num
  first_half = *(1..num).select {|int| int.odd?}
  second_half = first_half.reverse
  second_half.shift

  array = (first_half + second_half)

  # iterate over array to display diamond pattern
  array.each do |number|
    line = '*' * number

    loop do
      line.concat(' ').prepend(' ') if line.size < num
      break if line.size == num
    end

    puts line
  end
end

display_diamond(9)
display_diamond(21)