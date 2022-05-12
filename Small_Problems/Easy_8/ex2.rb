# Madlibs

def get_word(type)
  puts "Enter a #{type}:"
  gets.chomp
end

noun = get_word('noun')
verb = get_word('verb')
adj = get_word('adjective')
adv = get_word('adverb')

puts "Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!"