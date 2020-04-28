DEGREE = "\xC2\xB0"

# mod 360
# extract integer part
# extract decimal part (using mod 1?)
# calculate minutes and seconds
# return result in correct format

def dms(num)
  delta_num = num.to_f % 360
  deg = delta_num.to_i
  total_sec = ((delta_num - deg) * 3600).round
  min, sec = total_sec.divmod(60)
  format(%(#{deg}#{DEGREE}%02d'%02d"), min, sec)
end

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms_book(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  degrees = degrees % 360
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
