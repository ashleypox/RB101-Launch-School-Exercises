def center_of(str)
  arr = str.split("")

  if arr.length.odd?
    middle = arr.length / 2
    arr[middle]
  else
    middle2 = (arr.length / 2).round
    middle1 = middle2 - 1
    arr[middle1] + arr[middle2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'