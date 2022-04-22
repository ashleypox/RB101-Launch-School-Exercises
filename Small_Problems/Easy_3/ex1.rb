# exercise 1 - Easy 3
user_numbers = []
places = ['1st', "2nd", "3rd", "4th", "5th", "last"]

# methods
def prompt(string)
  puts "==> #{string}"
end

def get_numbers(array, numeric_places)
  for place in numeric_places
    prompt("Enter the #{place} number:")
    answer = gets.chomp.to_i
    array << answer
  end

  array
end

def search_array(array)
  search_num = array.pop
  counter = 0

  for item in array
    if item == search_num
      prompt("#{search_num} appears in #{array}")
      break
    elsif item != search_num
      counter += 1
      prompt("#{search_num} does not appear in #{array}.") if counter == array.size 
      next
    end
  end
end

# main
get_numbers(user_numbers, places)

search_array(user_numbers)

