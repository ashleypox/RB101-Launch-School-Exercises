def stringy(number)
  array = []

  if number >= 0
    number.times do |index|
      if index.odd?
        array << 0
      else
        array << 1
      end
    end
  end

  array.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'