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

def palindromes(str)
  arr = substrings(str)
  arr.select do |substr| 
    substr if substr == substr.reverse && substr.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
 ]