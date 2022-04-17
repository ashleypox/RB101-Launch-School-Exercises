def reverse_sentence(string)
  word_array = string.split(" ")
  new_array = word_array.reverse.join(" ")
end



puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''