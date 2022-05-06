def print_in_box(str)
  box_size = str.size + 2
  end_line = '-' * box_size
  mid_line = ' ' * box_size

  puts "+#{end_line}+"
  puts "|#{mid_line}|"
  puts "| #{str} |"
  puts "|#{mid_line}|"
  puts "+#{end_line}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')