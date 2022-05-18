BLOCKS = [ 
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
]

def block_word?(string)
  arr = string.upcase.split("")
  check = []

  arr.each do |letter|
    BLOCKS.each do |block|
      check << block if letter == block[0] || letter == block[1]
    end
  end

  check == check.uniq
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true