def staggered_case(str)
  arr = str.split("")
  new_arr = []

  arr.each_with_index do |letter, index|
    if index.even?
      new_arr << letter.upcase
    elsif index.odd?
      new_arr << letter.downcase
    end
  end

  new_arr.join("")
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'