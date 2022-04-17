def reverse_words(string)
  new_string = ''
  array = string.split(" ")
  new_array = []

  for word in array
    if word.size >= 5
      new_array << word.reverse
    else
      new_array << word
    end
  end

  new_string = new_array.join(" ")
end

puts reverse_words('Professional')  == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School') == 'hcnuaL loohcS'