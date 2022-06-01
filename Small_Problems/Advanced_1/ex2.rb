def center(line, n)
  loop do
    line = ' ' + line + ' ' if line.size < n
    break if line.size >= n
  end

  line
end

def star(n)
  output_arr = []
  mid_line = '*' * n
  count = 0

  loop do
    current_line = ['*', '*', '*']
    current_line = current_line.join(" " * count)
    output_arr.unshift(center(current_line, n))

    count += 1
    break if output_arr.length == n / 2
  end

  puts output_arr
  puts mid_line
  puts output_arr.reverse
end

star(7)
