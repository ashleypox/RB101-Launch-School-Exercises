def neutralize(sentence)
  words = sentence.split(' ')
  sentence = []

  words.each do |word|
    next if negative?(word)
    sentence << word
  end

  sentence.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.