statement = "The Flintstones Rock"
frequencies = Hash.new
array = statement.split("")

for letter in array
  frequencies[letter] = statement.count letter
end

p frequencies

