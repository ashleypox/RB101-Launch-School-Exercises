def reverse(array)
  new_arr = []
  index = -1

  array.length.times do 
    new_arr << array[index]
    index -= 1
  end

  new_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]         
p reverse(%w(a b e d c)) == %w(c d e b a)  
p reverse(['abc']) == ['abc']            
p reverse([]) == []                       

list = [1, 3, 2]                    
p new_list = reverse(list)            
p list.object_id != new_list.object_id 
p list == [1, 3, 2]             
p new_list == [2, 3, 1]        
