require 'time'
require 'date'

SECONDS_PER_MINUTE = 60

def after_midnight(time)
  delta_seconds = (Time.parse(time) - Time.parse(Date.today.to_s)).to_i
  delta_minutes = delta_seconds / SECONDS_PER_MINUTE
  delta_minutes % 1440
end

def before_midnight(time)
  delta_seconds = (Time.parse((Date.today + 1).to_s) - Time.parse(time)).to_i
  delta_minutes = delta_seconds / SECONDS_PER_MINUTE
  delta_minutes % 1440
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# Solution from other users:

def after_midnight(time_str)
  time = DateTime.parse(time_str)
  minutes, hours = time.minute, time.hour
  minutes + hours * MINUTES_PER_HOUR 
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes == MINUTES_PER_DAY ? 0 : delta_minutes
end
