class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => 'Fluffy'
puts fluffy # => 'My name is FLUFFY'
puts fluffy.name # => 'FLUFFY'
puts name # =>'FLUFFY'

name = 42
fluffy = Pet.new(name)
name += 1
p fluffy.name # => '42'
puts fluffy # => 'My name is 42'
p fluffy.name # => '42'
p name # => 43

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end
