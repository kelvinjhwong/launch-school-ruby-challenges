def center_of(string)
  string[(((string.length-1).to_f)/2).floor..(((string.length-1).to_f)/2).ceil]
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
