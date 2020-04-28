MINUTES_PER_HOUR = 60

def after_midnight(time)
  (time[0..1].to_i * MINUTES_PER_HOUR + time[3..4].to_i) % 1440
end

def before_midnight(time)
  (24 * 60 - after_midnight(time)) % 1440
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
