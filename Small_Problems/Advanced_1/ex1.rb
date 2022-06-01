word_lists = {
  noun: ['cat', 'dog', 'watermelon', 'bacon grease', 'book'],
  adj: ['pretty', 'smelly', 'damp', 'grumpy', 'greasy'],
  verb: ['naps', 'runs', 'eats', 'smells', 'licks'],
  adv:  ['lazily', 'grumpily', 'noiselessly', 'loudly']
}


File.open('ex1.txt') do |file|
  file.each do |line|
    puts format(line, noun: word_lists[:noun].sample,
                      adjective: word_lists[:adj].sample,
                      verb: word_lists[:verb].sample,
                      adverb: word_lists[:adv].sample)
  end
end
