words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def print_anagrams(arr)
  # create and populate hash
  hash = {}
  arr.each { |word| hash[word] = word.split('').sort.join }

  # make a new array with all possible word values
  arr_of_values = hash.values.uniq
  
  # iterate over possible values array to find matches
  arr_of_values.map do |value|
    # populate new hash with groupings from all values that match
    new_hsh = hash.select { |k, v| k if v == value }

    # print only the keys from the new hash, as an array
    p new_hsh.keys
  end
end

print_anagrams(words)