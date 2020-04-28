def triangle(length1, length2, length3)
  lengths = [length1, length2, length3].sort
  return :invalid if length1 <= 0 || lengths[0] + lengths[1] <= lengths[2]
  if lengths[0] == lengths[1] && lengths[0] == lengths[2]
    :equilateral
  elsif lengths[0] == lengths[1] || lengths[1] == lengths[2]
    :isosceles
  else
    :scalene
  end
end

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
