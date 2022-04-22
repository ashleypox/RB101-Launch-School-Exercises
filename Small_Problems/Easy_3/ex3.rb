def word_count(string)
  array = string.split("")
  array.delete(" ")
  array.size
end

puts "Please write word or multiple words:"
answer = gets.chomp

number = word_count(answer)

puts "There are #{number} characters in '#{answer}'."

