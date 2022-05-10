def swapcase(str)
  arr = str.split("")
  new_arr = arr.map do |letter|
              if letter == letter.upcase
                letter.downcase
              elsif letter == letter.downcase
                letter.upcase
              end
            end
  new_arr.join("")
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'