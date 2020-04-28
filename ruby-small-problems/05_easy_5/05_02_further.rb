MINUTES_PER_HOUR = 60
MINUTES_PER_WEEK = 60 * 24 * 7

def time_of_day(delta_minutes)
  midnight = Time.new(2018, 12, 16)
  delta_minutes = delta_minutes % MINUTES_PER_WEEK
  (midnight + delta_minutes * MINUTES_PER_HOUR).strftime('%A %H:%M')
end

puts time_of_day(0)
puts time_of_day(-3)
puts time_of_day(35)
puts time_of_day(-1437)
puts time_of_day(3000)
puts time_of_day(800)
puts time_of_day(-4231)
