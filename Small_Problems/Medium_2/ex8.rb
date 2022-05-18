def featured(num)
  multiple = 1
  featured_num = 0

  loop do 
    current = multiple * 7

    if current.odd? && current.digits == current.digits.uniq
      featured_num = current
    end

    if featured_num > num
      return featured_num
    elsif current >= 9_876_543_210
      return 'There is no possible number that fufills those requirements.'
    end

    multiple += 1
  end
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements