def integer_to_string(integer)
  integer.digits.reverse.join
end


def signed_integer_to_string(num)
  if num > 0
    string = integer_to_string(num)
    string.prepend("+")
  elsif num < 0
    num = -num
    string = integer_to_string(num)
    string.prepend("-")
  else
    string = integer_to_string(num)
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'