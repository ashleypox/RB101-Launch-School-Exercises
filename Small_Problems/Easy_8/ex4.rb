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

def substrings(str)
  new_str = str
  arr = []

  loop do
    arr << leading_substrings(new_str)
    new_str.slice!(0)
    break if new_str.size == 0
  end
  
  arr.flatten
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]