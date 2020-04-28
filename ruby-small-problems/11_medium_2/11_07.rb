def friday_13th(year)
  require 'date'
  (1..12).reduce(0) do |count, month|
    Date.new(year, month, 13).friday? ? count + 1 : count
  end
end

THIRTY_ONE_DAY_MONTHS = [1, 3, 5, 7, 8, 10, 12]
THIRTY_DAY_MONTHS = [4, 6, 9, 11]

def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

def five_friday_months(year)
  require 'date'
  (1..12).reduce(0) do |count, month|
    if THIRTY_ONE_DAY_MONTHS.include? month
      if [1, 2, 3].any? { |day| Date.new(year, month, day).friday? }
        count + 1
      else
        count
      end
    elsif THIRTY_DAY_MONTHS.include? month
      if [1, 2].any? { |day| Date.new(year, month, day).friday? }
        count + 1
      else
        count
      end
    elsif leap_year?(year)
      Date.new(year, month, 1).friday? ? count + 1 : count
    else
      count
    end
  end
end

def find_last_friday(date)
  date = Date.new(date.year, date.next_month.month, 1)
  loop do
    date = date.prev_day
    break if date.friday?
  end
  date
end

def five_friday_months(year)
  require 'date'
  (1..12).reduce(0) do |count, month|
    find_last_friday(Date.new(year, month, 1)).mday >= 29 ? count + 1 : count
  end
end

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

(1752..2019).each { |year| puts five_friday_months(year) }
