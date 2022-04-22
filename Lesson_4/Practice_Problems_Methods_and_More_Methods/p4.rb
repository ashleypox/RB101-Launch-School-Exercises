['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# return is # => { "a" => "ant", "b" => "bear", "c" => "cat" }
# each_with_object passes in an object ({}) as an argument. That object 
# is passed into the block and its updated value is returned at the end of each 
# iteration once it has finished iteratoins, it returns the intital object, 
# which has been updated by the iteration