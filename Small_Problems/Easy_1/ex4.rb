vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  type = array.uniq
  iteration = 0

  loop do
    occurances = array.count(type[iteration])
    puts "#{type[iteration]} => #{occurances}"
    iteration += 1

    break if type.size == iteration
  end
end

count_occurrences(vehicles)
