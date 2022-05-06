def crunch(str)
  arr = str.split('')
  index = 0 
  new_arr = []

  for letter in arr
    new_arr << letter unless arr[index] == arr[index + 1]
    index += 1
  end

  new_arr.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''