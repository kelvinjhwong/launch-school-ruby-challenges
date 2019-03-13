=begin

Input:
- 1 or 2 Integers
- Verse number, or range of verse numbers
- 0..99

Output:
- String
- Verse corresponding to input Integer, or verses
  corresponding to input range

Examples / edge cases / assumptions
- Assume always get valid input Integer (0 - 99), so
  no other types of objects, no negative Integers, no floats
- If 2 input Integers, assume first Integer always
  larger than second Integer
- Boundary conditions: verse # 2, 1 and 0

Algorithm:
- Iterate from higher verse_num #downto lower verse_num
  (both numbers could be the same)
  - If verse_num isn't 2, 1 or 0, then generate verse
    using template
  - Deal with each of the 2, 1 and 0 cases
    individually
  - Push verse into Array
- Join Array with "\n"

=end

class BeerSong
  def verses(num1, num2)
    num1.downto(num2).map { |num| verse(num) }.join("\n")
  end
  
  # def verse(num)
  #   case num
  #   when 0
  #     "No more bottles of beer on the wall, " \
  #     "no more bottles of beer.\n" \
  #     "Go to the store and buy some more, " \
  #     "99 bottles of beer on the wall.\n"
  #   when 1
  #     "1 bottle of beer on the wall, " \
  #     "1 bottle of beer.\n" \
  #     "Take it down and pass it around, " \
  #     "no more bottles of beer on the wall.\n"
  #   when 2
  #     "2 bottles of beer on the wall, " \
  #     "2 bottles of beer.\n" \
  #     "Take one down and pass it around, " \
  #     "1 bottle of beer on the wall.\n"
  #   else
  #     "#{num} bottles of beer on the wall, " \
  #     "#{num} bottles of beer.\n" \
  #     "Take one down and pass it around, " \
  #     "#{num - 1} bottles of beer on the wall.\n"
  #   end
  # end
  
  # def verse(num)
  #   verse = lyrics.split("\n\n")[99 - num]
  #   num == 0 ? verse : verse + "\n"
  # end
  
  def verse(verse_num)
    numbers_of_bottles = [ZeroBottles.new, OneBottle.new, TwoBottles.new] +
      (3..99).map { |num| NormalNumberOfBottles.new(num) }
    
    numbers_of_bottles[verse_num].generate_verse
  end
  
  def lyrics
    verses(99, 0)
  end
  
#   def lyrics
#     <<-SONG
# 99 bottles of beer on the wall, 99 bottles of beer.
# Take one down and pass it around, 98 bottles of beer on the wall.

# 98 bottles of beer on the wall, 98 bottles of beer.
# Take one down and pass it around, 97 bottles of beer on the wall.

# 97 bottles of beer on the wall, 97 bottles of beer.
# Take one down and pass it around, 96 bottles of beer on the wall.

# 96 bottles of beer on the wall, 96 bottles of beer.
# Take one down and pass it around, 95 bottles of beer on the wall.

# 95 bottles of beer on the wall, 95 bottles of beer.
# Take one down and pass it around, 94 bottles of beer on the wall.

# 94 bottles of beer on the wall, 94 bottles of beer.
# Take one down and pass it around, 93 bottles of beer on the wall.

# 93 bottles of beer on the wall, 93 bottles of beer.
# Take one down and pass it around, 92 bottles of beer on the wall.

# 92 bottles of beer on the wall, 92 bottles of beer.
# Take one down and pass it around, 91 bottles of beer on the wall.

# 91 bottles of beer on the wall, 91 bottles of beer.
# Take one down and pass it around, 90 bottles of beer on the wall.

# 90 bottles of beer on the wall, 90 bottles of beer.
# Take one down and pass it around, 89 bottles of beer on the wall.

# 89 bottles of beer on the wall, 89 bottles of beer.
# Take one down and pass it around, 88 bottles of beer on the wall.

# 88 bottles of beer on the wall, 88 bottles of beer.
# Take one down and pass it around, 87 bottles of beer on the wall.

# 87 bottles of beer on the wall, 87 bottles of beer.
# Take one down and pass it around, 86 bottles of beer on the wall.

# 86 bottles of beer on the wall, 86 bottles of beer.
# Take one down and pass it around, 85 bottles of beer on the wall.

# 85 bottles of beer on the wall, 85 bottles of beer.
# Take one down and pass it around, 84 bottles of beer on the wall.

# 84 bottles of beer on the wall, 84 bottles of beer.
# Take one down and pass it around, 83 bottles of beer on the wall.

# 83 bottles of beer on the wall, 83 bottles of beer.
# Take one down and pass it around, 82 bottles of beer on the wall.

# 82 bottles of beer on the wall, 82 bottles of beer.
# Take one down and pass it around, 81 bottles of beer on the wall.

# 81 bottles of beer on the wall, 81 bottles of beer.
# Take one down and pass it around, 80 bottles of beer on the wall.

# 80 bottles of beer on the wall, 80 bottles of beer.
# Take one down and pass it around, 79 bottles of beer on the wall.

# 79 bottles of beer on the wall, 79 bottles of beer.
# Take one down and pass it around, 78 bottles of beer on the wall.

# 78 bottles of beer on the wall, 78 bottles of beer.
# Take one down and pass it around, 77 bottles of beer on the wall.

# 77 bottles of beer on the wall, 77 bottles of beer.
# Take one down and pass it around, 76 bottles of beer on the wall.

# 76 bottles of beer on the wall, 76 bottles of beer.
# Take one down and pass it around, 75 bottles of beer on the wall.

# 75 bottles of beer on the wall, 75 bottles of beer.
# Take one down and pass it around, 74 bottles of beer on the wall.

# 74 bottles of beer on the wall, 74 bottles of beer.
# Take one down and pass it around, 73 bottles of beer on the wall.

# 73 bottles of beer on the wall, 73 bottles of beer.
# Take one down and pass it around, 72 bottles of beer on the wall.

# 72 bottles of beer on the wall, 72 bottles of beer.
# Take one down and pass it around, 71 bottles of beer on the wall.

# 71 bottles of beer on the wall, 71 bottles of beer.
# Take one down and pass it around, 70 bottles of beer on the wall.

# 70 bottles of beer on the wall, 70 bottles of beer.
# Take one down and pass it around, 69 bottles of beer on the wall.

# 69 bottles of beer on the wall, 69 bottles of beer.
# Take one down and pass it around, 68 bottles of beer on the wall.

# 68 bottles of beer on the wall, 68 bottles of beer.
# Take one down and pass it around, 67 bottles of beer on the wall.

# 67 bottles of beer on the wall, 67 bottles of beer.
# Take one down and pass it around, 66 bottles of beer on the wall.

# 66 bottles of beer on the wall, 66 bottles of beer.
# Take one down and pass it around, 65 bottles of beer on the wall.

# 65 bottles of beer on the wall, 65 bottles of beer.
# Take one down and pass it around, 64 bottles of beer on the wall.

# 64 bottles of beer on the wall, 64 bottles of beer.
# Take one down and pass it around, 63 bottles of beer on the wall.

# 63 bottles of beer on the wall, 63 bottles of beer.
# Take one down and pass it around, 62 bottles of beer on the wall.

# 62 bottles of beer on the wall, 62 bottles of beer.
# Take one down and pass it around, 61 bottles of beer on the wall.

# 61 bottles of beer on the wall, 61 bottles of beer.
# Take one down and pass it around, 60 bottles of beer on the wall.

# 60 bottles of beer on the wall, 60 bottles of beer.
# Take one down and pass it around, 59 bottles of beer on the wall.

# 59 bottles of beer on the wall, 59 bottles of beer.
# Take one down and pass it around, 58 bottles of beer on the wall.

# 58 bottles of beer on the wall, 58 bottles of beer.
# Take one down and pass it around, 57 bottles of beer on the wall.

# 57 bottles of beer on the wall, 57 bottles of beer.
# Take one down and pass it around, 56 bottles of beer on the wall.

# 56 bottles of beer on the wall, 56 bottles of beer.
# Take one down and pass it around, 55 bottles of beer on the wall.

# 55 bottles of beer on the wall, 55 bottles of beer.
# Take one down and pass it around, 54 bottles of beer on the wall.

# 54 bottles of beer on the wall, 54 bottles of beer.
# Take one down and pass it around, 53 bottles of beer on the wall.

# 53 bottles of beer on the wall, 53 bottles of beer.
# Take one down and pass it around, 52 bottles of beer on the wall.

# 52 bottles of beer on the wall, 52 bottles of beer.
# Take one down and pass it around, 51 bottles of beer on the wall.

# 51 bottles of beer on the wall, 51 bottles of beer.
# Take one down and pass it around, 50 bottles of beer on the wall.

# 50 bottles of beer on the wall, 50 bottles of beer.
# Take one down and pass it around, 49 bottles of beer on the wall.

# 49 bottles of beer on the wall, 49 bottles of beer.
# Take one down and pass it around, 48 bottles of beer on the wall.

# 48 bottles of beer on the wall, 48 bottles of beer.
# Take one down and pass it around, 47 bottles of beer on the wall.

# 47 bottles of beer on the wall, 47 bottles of beer.
# Take one down and pass it around, 46 bottles of beer on the wall.

# 46 bottles of beer on the wall, 46 bottles of beer.
# Take one down and pass it around, 45 bottles of beer on the wall.

# 45 bottles of beer on the wall, 45 bottles of beer.
# Take one down and pass it around, 44 bottles of beer on the wall.

# 44 bottles of beer on the wall, 44 bottles of beer.
# Take one down and pass it around, 43 bottles of beer on the wall.

# 43 bottles of beer on the wall, 43 bottles of beer.
# Take one down and pass it around, 42 bottles of beer on the wall.

# 42 bottles of beer on the wall, 42 bottles of beer.
# Take one down and pass it around, 41 bottles of beer on the wall.

# 41 bottles of beer on the wall, 41 bottles of beer.
# Take one down and pass it around, 40 bottles of beer on the wall.

# 40 bottles of beer on the wall, 40 bottles of beer.
# Take one down and pass it around, 39 bottles of beer on the wall.

# 39 bottles of beer on the wall, 39 bottles of beer.
# Take one down and pass it around, 38 bottles of beer on the wall.

# 38 bottles of beer on the wall, 38 bottles of beer.
# Take one down and pass it around, 37 bottles of beer on the wall.

# 37 bottles of beer on the wall, 37 bottles of beer.
# Take one down and pass it around, 36 bottles of beer on the wall.

# 36 bottles of beer on the wall, 36 bottles of beer.
# Take one down and pass it around, 35 bottles of beer on the wall.

# 35 bottles of beer on the wall, 35 bottles of beer.
# Take one down and pass it around, 34 bottles of beer on the wall.

# 34 bottles of beer on the wall, 34 bottles of beer.
# Take one down and pass it around, 33 bottles of beer on the wall.

# 33 bottles of beer on the wall, 33 bottles of beer.
# Take one down and pass it around, 32 bottles of beer on the wall.

# 32 bottles of beer on the wall, 32 bottles of beer.
# Take one down and pass it around, 31 bottles of beer on the wall.

# 31 bottles of beer on the wall, 31 bottles of beer.
# Take one down and pass it around, 30 bottles of beer on the wall.

# 30 bottles of beer on the wall, 30 bottles of beer.
# Take one down and pass it around, 29 bottles of beer on the wall.

# 29 bottles of beer on the wall, 29 bottles of beer.
# Take one down and pass it around, 28 bottles of beer on the wall.

# 28 bottles of beer on the wall, 28 bottles of beer.
# Take one down and pass it around, 27 bottles of beer on the wall.

# 27 bottles of beer on the wall, 27 bottles of beer.
# Take one down and pass it around, 26 bottles of beer on the wall.

# 26 bottles of beer on the wall, 26 bottles of beer.
# Take one down and pass it around, 25 bottles of beer on the wall.

# 25 bottles of beer on the wall, 25 bottles of beer.
# Take one down and pass it around, 24 bottles of beer on the wall.

# 24 bottles of beer on the wall, 24 bottles of beer.
# Take one down and pass it around, 23 bottles of beer on the wall.

# 23 bottles of beer on the wall, 23 bottles of beer.
# Take one down and pass it around, 22 bottles of beer on the wall.

# 22 bottles of beer on the wall, 22 bottles of beer.
# Take one down and pass it around, 21 bottles of beer on the wall.

# 21 bottles of beer on the wall, 21 bottles of beer.
# Take one down and pass it around, 20 bottles of beer on the wall.

# 20 bottles of beer on the wall, 20 bottles of beer.
# Take one down and pass it around, 19 bottles of beer on the wall.

# 19 bottles of beer on the wall, 19 bottles of beer.
# Take one down and pass it around, 18 bottles of beer on the wall.

# 18 bottles of beer on the wall, 18 bottles of beer.
# Take one down and pass it around, 17 bottles of beer on the wall.

# 17 bottles of beer on the wall, 17 bottles of beer.
# Take one down and pass it around, 16 bottles of beer on the wall.

# 16 bottles of beer on the wall, 16 bottles of beer.
# Take one down and pass it around, 15 bottles of beer on the wall.

# 15 bottles of beer on the wall, 15 bottles of beer.
# Take one down and pass it around, 14 bottles of beer on the wall.

# 14 bottles of beer on the wall, 14 bottles of beer.
# Take one down and pass it around, 13 bottles of beer on the wall.

# 13 bottles of beer on the wall, 13 bottles of beer.
# Take one down and pass it around, 12 bottles of beer on the wall.

# 12 bottles of beer on the wall, 12 bottles of beer.
# Take one down and pass it around, 11 bottles of beer on the wall.

# 11 bottles of beer on the wall, 11 bottles of beer.
# Take one down and pass it around, 10 bottles of beer on the wall.

# 10 bottles of beer on the wall, 10 bottles of beer.
# Take one down and pass it around, 9 bottles of beer on the wall.

# 9 bottles of beer on the wall, 9 bottles of beer.
# Take one down and pass it around, 8 bottles of beer on the wall.

# 8 bottles of beer on the wall, 8 bottles of beer.
# Take one down and pass it around, 7 bottles of beer on the wall.

# 7 bottles of beer on the wall, 7 bottles of beer.
# Take one down and pass it around, 6 bottles of beer on the wall.

# 6 bottles of beer on the wall, 6 bottles of beer.
# Take one down and pass it around, 5 bottles of beer on the wall.

# 5 bottles of beer on the wall, 5 bottles of beer.
# Take one down and pass it around, 4 bottles of beer on the wall.

# 4 bottles of beer on the wall, 4 bottles of beer.
# Take one down and pass it around, 3 bottles of beer on the wall.

# 3 bottles of beer on the wall, 3 bottles of beer.
# Take one down and pass it around, 2 bottles of beer on the wall.

# 2 bottles of beer on the wall, 2 bottles of beer.
# Take one down and pass it around, 1 bottle of beer on the wall.

# 1 bottle of beer on the wall, 1 bottle of beer.
# Take it down and pass it around, no more bottles of beer on the wall.

# No more bottles of beer on the wall, no more bottles of beer.
# Go to the store and buy some more, 99 bottles of beer on the wall.
#     SONG
#   end
end

class NumberOfBottles
  def initialize(number)
    @number = number
  end
  
  def generate_verse
    
  end
  private
  
  attr_reader :number
end

class NormalNumberOfBottles < NumberOfBottles
  def generate_verse
    "#{number} bottles of beer on the wall, " \
    "#{number} bottles of beer.\n" \
    "Take one down and pass it around, " \
    "#{number - 1} bottles of beer on the wall.\n"
  end
end

class TwoBottles < NumberOfBottles
  def initialize
    super(2)
  end
  
  def generate_verse
    "2 bottles of beer on the wall, " \
    "2 bottles of beer.\n" \
    "Take one down and pass it around, " \
    "1 bottle of beer on the wall.\n"
  end
end

class OneBottle < NumberOfBottles
  def initialize
    super(1)
  end
  
 def generate_verse
    "1 bottle of beer on the wall, " \
    "1 bottle of beer.\n" \
    "Take it down and pass it around, " \
    "no more bottles of beer on the wall.\n"
  end 
end

class ZeroBottles < NumberOfBottles
  def initialize
    super(0)
  end
  
  def generate_verse
    "No more bottles of beer on the wall, " \
    "no more bottles of beer.\n" \
    "Go to the store and buy some more, " \
    "99 bottles of beer on the wall.\n"
  end
end