SQM_TO_SQFT = 10.7639

puts 'Enter the length of the room in feet:'

length = gets.chomp.to_f

puts 'Enter the width of the room in feet:'

width = gets.chomp.to_f

area_sqft = (length * width).round(2)
area_sqinch = area_sqft * (12**2)
area_sqm = (area_sqft / SQM_TO_SQFT).round(2)
area_sqcm = area_sqm * (100**2)

puts "The area of the room is #{area_sqft} square feet " + \
     "(#{area_sqinch} square inches, #{area_sqm} square metres " + \
     "and #{area_sqcm} square centimentres)."
