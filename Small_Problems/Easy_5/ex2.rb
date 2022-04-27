MINUTES_PER_DAY = 1440
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60

def normalize_minutes(minutes)
  if minutes < 0
    loop do
      minutes += MINUTES_PER_DAY
      break if minutes >= 0
    end
  elsif minutes > MINUTES_PER_DAY
    loop do
      minutes -= MINUTES_PER_DAY if minutes > MINUTES_PER_DAY
      break if minutes < MINUTES_PER_DAY
    end
  end

  minutes
end
    

def time_of_day(num)
  days_mins = normalize_minutes(num)
  hours, minutes = days_mins.divmod(MINUTES_PER_HOUR)

  hours = hours.to_s
  minutes = minutes.to_s
  
  hours.prepend('0') if hours.chars.size != 2
  minutes.prepend('0') if minutes.chars.size != 2

  "#{hours}:#{minutes}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"