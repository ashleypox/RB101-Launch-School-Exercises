say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1

  if counter == 5
    say_hello = false
  end
end

