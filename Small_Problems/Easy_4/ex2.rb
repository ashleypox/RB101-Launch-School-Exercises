def number_endings(number)
ends_with = number.digits.reverse.last
  if [11, 12, 13].include?(number % 100)
    p number.to_s + "th"
  else   
    if ends_with == 1
      p number.to_s + "st"
    elsif ends_with == 2
      p number.to_s + "nd"
    elsif ends_with == 3
      p number.to_s + 'rd'
    else
      p number.to_s + 'th'
    end
  end
end

def century(year)
  century = year / 100 + 1 
  century -= 1 if year % 100 == 0
  number_endings(century)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'