def balanced?(str)
  par = ''
  str.chars.each { |c| par << c if c == '(' || c == ')' }
  
  loop do 
    par.gsub!('()', '')
    break unless par.include?('()')
  end

  par == '' ? true : false    
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

