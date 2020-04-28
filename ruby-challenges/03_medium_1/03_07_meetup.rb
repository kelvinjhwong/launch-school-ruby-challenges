=begin

***Did not watch solution video***

Input:
- Year, month
- Weekday, 1st/2nd/3rd/4th/last/teenth

Output:
- Day of month

Examples / edge cases / assumptions:


Algorithm:
- Store wday word => wday num as Hash
- Store :first, :second, :third, :fourth => 1, 2, 3, 4 as Hash
- Initialize Date object with 1st as day of month
- Check the weekday, then add the appropriate number of days

- If :last, then :fourth; if fifth is still in the same month, then go to :fifth
- If :teenth, then try :second; if not in 13..19, then try :third

- Handle :last, :teenth case

=end

require 'date'

class Meetup
  # def initialize(month, year)
  #   @date = Date.new(year, month)
  # end
  
  # def day(weekday, schedule)
  #   case schedule
  #   when *(ORDINAL_NUMS.keys)
  #     days_to_increment = (WEEKDAY_WORD_TO_NUM[weekday] - date.wday) % 7 +
  #       (7 * (ORDINAL_NUMS[schedule] - 1))
        
  #     self.date = date.next_day(days_to_increment)
  #   when :teenth
  #     days_to_next_same_wday = (WEEKDAY_WORD_TO_NUM[weekday] - date.wday) % 7 + 7
  #     days_to_increment =
  #       days_to_next_same_wday >= 12 ? days_to_next_same_wday : days_to_next_same_wday + 7
      
  #     self.date = date.next_day(days_to_increment)
  #   when :last
  #     self.date = date.next_month.prev_day
      
  #     days_to_decrement =
  #       (date.wday - WEEKDAY_WORD_TO_NUM[weekday]) % 7
      
  #     self.date = date.prev_day(days_to_decrement)
  #   end
    
  #   date
  # end
  
  def initialize(month, year)
    @year = year
    @month= month
  end
  
  def day(weekday, schedule)
    first_day = Date.new(year, month, FIRST_DAY_TO_SEARCH[schedule])
    (first_day..(first_day + 6)).detect { |date| date.send(weekday.to_s + '?') }
  end
  
  private
  
  # WEEKDAY_WORD_TO_NUM = {
  #   monday: 1,
  #   tuesday: 2,
  #   wednesday: 3,
  #   thursday: 4,
  #   friday: 5,
  #   saturday: 6,
  #   sunday: 7
  # }
  
  # ORDINAL_NUMS = {
  #   first: 1,
  #   second: 2,
  #   third: 3,
  #   fourth: 4
  # }
  
  FIRST_DAY_TO_SEARCH = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    last: -7,
    teenth: 13
  }
  
  # attr_accessor :date
  attr_reader :year, :month
end
