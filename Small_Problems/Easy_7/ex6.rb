def letter?(str)
  !!str.scan(/[A-z]/)
end

def staggered_case(str)
  arr = str.split("")
  new_arr = []
  counter = 0

  arr.each do |letter|
    if letter?(letter)
      if counter.even?
        new_arr << letter.upcase
        counter += 1
      elsif counter.odd?
        new_arr << letter.downcase
        counter += 1
      end
    else
      letter
    end
  end

  new_arr.join("")
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'