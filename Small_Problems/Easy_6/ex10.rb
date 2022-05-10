def triangle(num)
  arr = *(1..num)
  
  arr.each do |element|
    str = "*" * element

    loop do
      break if str.size > num
      str = " " + str
    end

    puts str
  end
end

triangle(5)