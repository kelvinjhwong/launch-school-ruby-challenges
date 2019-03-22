=begin

***Did not watch solution video***

Problem:
- Randomly generate a name for a robot
- Every new name should not be same as any existing name
- Calling #name should return the same name every time
  (i.e. NOT generate a new name every time)
=end

class Robot
  @@existing_names = []
  
  def initialize
    # Randomly generate new name EVERY TIME - even if same seed
    
    @name = generate_name
    @@existing_names << @name
  end
  
  def name
    # Return the name, or if it doesn't exist, generate new, DIFFERENT name
    
    return @name unless @name.nil?
    initialize
    @name
  end
  
  def reset # Should wipe the name
    @name = nil
  end
  
  private
  
  def generate_name
    name = ''
    
    loop do
      name = ('AA'..'ZZ').to_a.sample + format("%03d", rand(1000))
      break unless @@existing_names.include? name
    end
    
    name
  end
end
