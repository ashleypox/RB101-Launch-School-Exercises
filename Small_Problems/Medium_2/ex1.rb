source = File.read('ex1.txt')

sentences = source.split(/\.|\?|!/)
longest = sentences.max_by(&:length)
puts "#{longest}, #{longest.split.length}"


