def consonant?(str)
  true unless str =~ /[-!aeiou ]/ || str.to_i.to_s == str
end

def double_consonants(str)
  arr = str.split("").map do |letter|
    if consonant?(letter)
      letter + letter 
    else
      letter
    end
  end

  arr.join("")
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""