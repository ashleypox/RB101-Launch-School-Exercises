def cleanup(string)
  new_str = string.gsub(/[-'+*&?]/, ' ')
  new_str.squeeze(" ")
end

p cleanup("---what's my +*& line?") == ' what s my line '