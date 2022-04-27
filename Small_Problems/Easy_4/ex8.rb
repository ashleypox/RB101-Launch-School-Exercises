def string_to_integer(string)
  str_to_int_hash = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
  }

  arr_of_str = string.chars.map {|str| str_to_int_hash[str]}
  
  count = 0
  arr_of_int = []
  arr_of_str.reverse.map do |num| 
    arr_of_int << (num * (10**count))
    count += 1
  end
  
  arr_of_int.sum
end

def string_to_signed_integer(string)
  if string.include?('-')
    alt_str = string.gsub(/[-]/, '')

    pos_int = string_to_integer(alt_str)
    neg_int = pos_int - (pos_int * 2)
  elsif string.include?('+')
    alt_str = string.gsub(/[+]/, '')

    string_to_integer(alt_str)
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100