def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if angles.any? { |angle| angle <= 0 } || angles.sum != 180
  if angles.any? { |angle| angle > 90 }
    :obtuse
  elsif angles.include? 90
    :right
  else
    :acute
  end
end

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
