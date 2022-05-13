def buy_fruit(arr)
  new_arr = arr.map do |in_arr|
    [in_arr[0]] * in_arr[1]
  end

  new_arr.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]