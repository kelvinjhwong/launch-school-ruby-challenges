class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking=false)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student; end