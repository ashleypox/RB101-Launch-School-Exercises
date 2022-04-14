names = ['Sally', 'Joe', 'Lisa', 'Henry']
counter = 0

loop do
  puts names[counter]
  names.shift

  break if names.size == 0
end
