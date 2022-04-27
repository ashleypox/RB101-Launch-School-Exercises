def by_4?(num)
  num % 4 == 0
end

def by_100?(num)
  num % 100 == 0
end

def by_400?(num)
  num % 400 == 0
end

def leap_year?(year)
  if by_4?(year)
    if by_100?(year) == false
      true
    elsif by_100?(year)
      if by_400?(year)
        true
      else
        false
      end
    end
  elsif by_4?(year) == false
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true