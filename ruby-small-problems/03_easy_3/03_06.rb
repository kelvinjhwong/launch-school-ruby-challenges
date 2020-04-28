def xor?(bool1, bool2)
  if bool1 && bool2
    false
  elsif bool1 && !bool2
    true
  elsif !bool1 && bool2
    true
  elsif !bool1 && !bool2
    false
  end
end

def xor2?(v1, v2)
  (v1 && !v2) || (!v1 && v2)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
