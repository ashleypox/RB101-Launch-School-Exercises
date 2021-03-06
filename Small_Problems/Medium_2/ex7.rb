require 'date'

def friday_13th(year)
  calendar_year = Date.new(year).step(Date.new(year,-1,-1))
  calendar_year.select {|d| d.friday? && d.day == 13}.size
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2