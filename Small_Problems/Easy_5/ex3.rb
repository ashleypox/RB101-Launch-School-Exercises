MINUTES_PER_DAY = 1440
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60

def unformat(string)
  arr = string.gsub(/[:]/, '').chars
  arr.map {|char| char.to_i}
end

def after_midnight(string)
  arr = unformat(string)
  hours = (arr[0] * 10) + (arr[1])
  minutes_in_day = (arr[2] * 10) + arr[3]

  hours_in_day = (hours * MINUTES_PER_HOUR)
  total_minutes = hours_in_day + minutes_in_day

  total_minutes = 0 if total_minutes == MINUTES_PER_DAY
  
  total_minutes
end

def before_midnight(string)
  total_minutes = after_midnight(string)
  
  min_before_midnight = MINUTES_PER_DAY - total_minutes
  min_before_midnight = 0 if min_before_midnight == MINUTES_PER_DAY

  min_before_midnight
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0