['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# from the ruby documentation, we can find that count uses the return value to 
# evaluate truthiness, then returns a number based on how many iterations return
# true. 