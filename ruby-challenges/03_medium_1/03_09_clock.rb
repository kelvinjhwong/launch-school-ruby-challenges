=begin

***Did not watch solution video***

Examples / edge cases / assumptions:
- Return new object?

Assumptions:
- Won't get invalid input - non-Integers, or Integers < 0 or >= 24 for hours,
  and Integers < 0 or >= 60 for minutes

- 23:30 + 60 => 23:90 => 24:30 => 00:30
- Add directly to the minutes => calculate number of hours to increment => wrap hours around 24

- 10:00 - 90 => 10:-90 => 08:30

- 00:30 - 60 => 00:-30 => -01:30 => 23:30

=end

class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    
    normalize_time
  end
  
  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end
  
  def to_s
    # Format hours and minutes accordingly
    format("%02d:%02d", hours, minutes)
  end
  
  def +(number_of_minutes)
    self.class.at(hours, minutes + number_of_minutes)
  end
  
  def -(number_of_minutes)
    self.class.at(hours, minutes - number_of_minutes)
  end
  
  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
  
  protected
  
  attr_accessor :hours, :minutes
  
  private
  
  def normalize_time
    hours_to_add, remaining_minutes = minutes.divmod(60)
    
    self.minutes = remaining_minutes
    self.hours = (hours + hours_to_add) % 24
  end
end
