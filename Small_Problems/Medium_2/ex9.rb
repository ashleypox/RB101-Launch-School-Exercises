def bubble_sort!(arr)
  loop do
    swapped = false
    
    (arr.length - 1).times do |i|
      next if arr[i] <= arr[i + 1]

      arr[i], arr[i + 1] = arr[i + 1], arr[i]
      swapped = true
    end

    break if swapped == false
  end
  arr
end


p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)