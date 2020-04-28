class Pet
  def initialize(animal, name)
    @animal = animal
    @name = name
  end
  
  def to_s
    "a #{animal} named #{name}"
  end
  
  private
  
  attr_reader :animal, :name
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end
  
  def add_pet(pet)
    pets << pet
  end
  
  def print_pets
    pets.each { |pet| puts pet }
  end
  
  def number_of_pets
    pets.size
  end
  
  private
  
  attr_reader :pets
end

class Shelter
  def initialize
    @unadopted_pets = []
    @owners = []
  end
  
  def add_unadopted_pets(*pets)
    pets.each { |pet| unadopted_pets << pet }
  end
  
  def adopt(owner, pet)
    owner.add_pet(unadopted_pets.delete(pet))
    owners << owner if !(owners.include?(owner))
  end
  
  def print_adoptions
    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
      puts
    end
    
    puts 'The Animal Shelter has the following unadopted pets:'
    unadopted_pets.each { |pet| puts pet }
    puts
  end
  
  def number_of_unadopted_pets
    unadopted_pets.size
  end
  
  private
  
  attr_accessor :owners, :unadopted_pets
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.add_unadopted_pets(butterscotch, pudding, darwin, kennedy)
shelter.add_unadopted_pets(sweetie, molly, chester, asta)
shelter.add_unadopted_pets(laddie, fluffy, kat, ben)
shelter.add_unadopted_pets(chatterbox, bluebell)
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal Shelter has #{shelter.number_of_unadopted_pets} unadopted pets."