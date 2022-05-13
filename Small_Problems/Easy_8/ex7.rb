def repeater(str)
  arr = str.split("").map do |letter|
    letter + letter
  end

  arr.join("")
end

