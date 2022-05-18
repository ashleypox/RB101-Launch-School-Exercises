def flip_switch(value) # changes switch from on to off or vice versa
  value == 'on' ? 'off' : 'on'
end

def toggle_lights(no_of_switches)
  # create and populate hash with light that are 'off'
  all_switches = (1..no_of_switches).to_a
  hash = Hash[all_switches.map { |switch| [switch, 'off'] }]
  counter = 1 # init counter for value to skip switches by

  loop do
    hash.each do |switch_no, value|
      # if counter divides into key evenly, flip switch
      switch_no % counter == 0 ? hash[switch_no] = flip_switch(value) : next
    end

    # break once we complete an iteration for each key
    counter += 1
    break if counter == no_of_switches + 1
  end

  # select all keys with 'on' value and return as an array
  hash.select { |k, v| k if v == 'on'}.keys
end

p toggle_lights(5)
p toggle_lights(1000)