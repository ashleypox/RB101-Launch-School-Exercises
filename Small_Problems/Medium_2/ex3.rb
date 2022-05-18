def calc_percent(num, denom)
  (num / denom) * 100
end

def letter_percentages(str)
  percentages = {}
  arr = str.split('')
  count = [0, 0, 0]

  arr.each do |letter|
    if letter.match?(/[a-z]/)
      count[0] += 1
    elsif letter.match?(/[A-Z]/)
      count[1] += 1
    else
      count[2] += 1
    end
  end

  percentages[:lowercase] =  calc_percent(count[0].to_f, str.size)
  percentages[:uppercase] = calc_percent(count[1].to_f, str.size)
  percentages[:neither] = calc_percent(count[2].to_f, str.size)

  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }