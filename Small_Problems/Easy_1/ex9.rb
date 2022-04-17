def sum(number)
  array = number.digits
  array.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45