def leading_substrings(str)
  arr = str.split('')
  current_letters = []
  new_arr = []

  arr.each do |letter|
    current_letters << letter
    new_arr << current_letters.join
  end

  new_arr
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']